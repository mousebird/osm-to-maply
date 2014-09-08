osm-to-maply
============

There are several online and offline vector tile formats that WhirlyGlobe-Maply supports.  Here’s how to create the Maply vector tile format from OpenStreetMap data.

==Pre-requisites

[QGIS](http://www.qgis.org/en/site/): Used for editing shapefiles
[GDAL](http://gdal.org/): ogr2ogr is used for linear simplification
[TileMill](https://www.mapbox.com/tilemill/): Used to generate the Mapnik XML

==Source data

Go get a set of OSM shape files.  We like the ones from [Geofabrik](http://download.geofabrik.de/).

Download them and put them in directory called “shape files”

==Preparing the source data

Several of the tiles are missing an attribute we need for sorting: area.

Using QGIS modify the files landuse.shp natural.shap and buildings.shp
  Toggle editing (so you can make changes)
  Open Field Calculator
  Create a new field called “area” as a decimal number
  Put “$area * 100000000” in the Expression field

Be sure to save each of those files.  I recommend loading them up again to make sure the changes too.

Now run the “build_simple.sh” script on the command line.
  This will generate simplified versions of several of the shape files.  We’ll need those for later.

==Styling the map

Create a new project in TileMill.

Load each of those shape files in as individual layers.  Keep their names as TileMill makes them.

Open style.mss in a text editor.  Copy the whole thing and paste it into the style.mm that TileMill made for you.
  You’re replacing the style sheet here.

Save the style and it should begin showing you data.

==Building the vector tiles

From TileMill you can export Mapnik XML.  Save this to mapnik_style.xml.

To build the vector tiles you’ll need to compile carto_vector_dice from the WhirlyGlobe-Maply [distribution](https://github.com/mousebird/WhirlyGlobe).

There are many options to carto_vector_dice, but this set should work reasonably well:
carto_vector_dice -targetdir my_tiles -targetdb my_db.sqlite -config mapnik_style.xml -levels 6 16
