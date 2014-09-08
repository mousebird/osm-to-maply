cd shapefiles

rm *simpl?.*

echo Simplifying roads
ogr2ogr -simplify 0.001 roads_simpl1.shp roads.shp
ogr2ogr -simplify 0.01 roads_simpl2.shp roads.shp

echo Simplifying railways
ogr2ogr -simplify 0.001 railway_simpl1.shp railways.shp

echo Simplifying waterways
ogr2ogr -simplify 0.001 waterways_simpl1.shp waterways.shp

echo Simplifying landuse
ogr2ogr -simplify 0.001 landusesimpl1.shp landuse.shp

echo Simplifying natural
ogr2ogr -simplify 0.001 naturalsimpl1.shp natural.shp
ogr2ogr -simplify 0.01 naturalsimpl2.shp natural.shp

