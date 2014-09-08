/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

Map {
  background-color: @water;
}

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* set up font sets for various weights and styles */
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans_lt_italic:    "Open Sans Italic","DejaVu Sans Italic","unifont Medium";
@sans:              "Open Sans Semibold","DejaVu Sans Book","unifont Medium";
@sans_italic:       "Open Sans Semibold Italic","DejaVu Sans Italic","unifont Medium";
@sans_bold:         "Open Sans Bold","DejaVu Sans Bold","unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #FCFBE7;
@water:             #C4DFF6;
@grass:             #E6F2C1;
@beach:             #FFEEC7;
@park:              #DAF2C1;
@cemetery:          #D6DED2;
@wooded:            #C3D9AD;
@agriculture:       #F2E8B6;

@building:          #E4E0E0;
@hospital:          rgb(229,198,195);
@school:            #FFF5CC;
@sports:            #B8E6B8;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #EEE;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #E65C5C;
@motorway_fill:     lighten(@motorway_line,10%);
@motorway_case:     @motorway_line * 0.9;

@trunk_line:        #E68A5C;
@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:        @trunk_line * 0.9;

@primary_line:      #FFC859;
@primary_fill:      lighten(@primary_line,10%);
@primary_case:      @primary_line * 0.9;

@secondary_line:    #FFE873;
@secondary_fill:    lighten(@secondary_line,10%);
@secondary_case:    @secondary_line * 0.9;

@standard_line:     @land * 0.85;
@standard_fill:     #fff;
@standard_case:     @land * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        #FAFAF5;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;

@text_halo:         1.0;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #435;
@country_halo:      @place_halo;

@state_text:        #546;
@state_halo:        @place_halo;

@city_text:         #444;
@city_halo:         @place_halo;

@town_text:         #666;
@town_halo:         @place_halo;

@poi_text:          #888;

@road_text:         #777;
@road_halo:         #fff;

@other_text:        #888;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;

/* ****************************************************************** */

#braziloutline [zoom < 13] {
  polygon-fill: white;
}

#brazilland2 [zoom >= 12] {
  polygon-fill: white
}

/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

// ==================================================================
// LANDUSE & LANDCOVER
// ==================================================================

#landusesimpl1
{
  [zoom>=6][zoom<8][area > 500000],
  {
    [type='cemetery']      { polygon-fill: @cemetery; }
    [type='college']       { polygon-fill: @school; }
    [type='commercial']    { polygon-fill: @industrial; }
    [type='common']        { polygon-fill: @park; }
    [type='forest']        { polygon-fill: @wooded; }
    [type='golf_course']   { polygon-fill: @sports; }
    [type='grass']         { polygon-fill: @grass; }
    [type='hospital']      { polygon-fill: @hospital; }
    [type='industrial']    { polygon-fill: @industrial; }
    [type='park']          { polygon-fill: @park; }
    [type='parking']       { polygon-fill: @parking; }
    [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [type='pitch']         { polygon-fill: @sports; }
    [type='residential']   { polygon-fill: @residential; }
    [type='school']        { polygon-fill: @school; }
    [type='sports_center'] { polygon-fill: @sports; }
    [type='stadium']       { polygon-fill: @sports; }
    [type='university']    { polygon-fill: @school; }
    [type='wood']          { polygon-fill: @wooded; 
    						 polygon-opacity: 0.3}
    [type='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.3;
        marker-file: url(park2-24.svg);
      }
    [type='water'],[type='reservoir'] 
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }      	   
  }
}

#landusesimpl1
{
  [zoom>=8][zoom<12][area > 10000]
  {
    [type='cemetery']      { polygon-fill: @cemetery; }
    [type='college']       { polygon-fill: @school; }
    [type='commercial']    { polygon-fill: @industrial; }
    [type='common']        { polygon-fill: @park; }
    [type='forest']        { polygon-fill: @wooded; }
    [type='golf_course']   { polygon-fill: @sports; }
    [type='grass']         { polygon-fill: @grass; }
    [type='hospital']      { polygon-fill: @hospital; }
    [type='industrial']    { polygon-fill: @industrial; }
    [type='park']          { polygon-fill: @park; }
    [type='parking']       { polygon-fill: @parking; }
    [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [type='pitch']         { polygon-fill: @sports; }
    [type='residential']   { polygon-fill: @residential; }
    [type='school']        { polygon-fill: @school; }
    [type='sports_center'] { polygon-fill: @sports; }
    [type='stadium']       { polygon-fill: @sports; }
    [type='university']    { polygon-fill: @school; }
    [type='wood']          { polygon-fill: @wooded; 
    						 polygon-opacity: 0.3}
    [type='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.3;
      }
    [type='water'],[type='reservoir']    
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
  }
}

#landuse
{
  [zoom>=12][zoom<14][area > 1000]
  {
    [type='cemetery']      { polygon-fill: @cemetery; }
    [type='college']       { polygon-fill: @school; }
    [type='commercial']    { polygon-fill: @industrial; }
    [type='common']        { polygon-fill: @park; }
    [type='forest']        { polygon-fill: @wooded; }
    [type='golf_course']   { polygon-fill: @sports; }
    [type='grass']         { polygon-fill: @grass; }
    [type='hospital']      { polygon-fill: @hospital; }
    [type='industrial']    { polygon-fill: @industrial; }
    [type='park']          { polygon-fill: @park; }
    [type='parking']       { polygon-fill: @parking; }
    [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [type='pitch']         { polygon-fill: @sports; }
    [type='residential']   { polygon-fill: @residential; }
    [type='school']        { polygon-fill: @school; }
    [type='sports_center'],[type='stadium'] { polygon-fill: @sports; }
    [type='stadium']       { polygon-fill: @sports; }
    [type='university']    { polygon-fill: @school; }
    [type='wood']          { polygon-fill: @wooded; 
    						 polygon-opacity: 0.3}
    [type='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.3;
      }
    [type='water'],[type='reservoir']   
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
  }
}
// military, retail not filled in 

#landuse
{
  [zoom>=14]
  {
    [type='cemetery']      { polygon-fill: @cemetery;}
    [type='college']       { polygon-fill: @school; }
    [type='commercial']    { polygon-fill: @industrial; }
    [type='common']        { polygon-fill: @park; }
    [type='forest']        { polygon-fill: @wooded; }
    [type='golf_course']   { polygon-fill: @sports; }
    [type='grass']         { polygon-fill: @grass; }
    [type='hospital']      { polygon-fill: @hospital; }
    [type='industrial']    { polygon-fill: @industrial; }
    [type='park']          { polygon-fill: @park; }
    [type='parking']       { polygon-fill: @parking; }
    [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [type='pitch']         { polygon-fill: @sports; }
    [type='residential']   { polygon-fill: @residential; }
    [type='school']        { polygon-fill: @school; }
    [type='sports_center'] { polygon-fill: @sports; }
    [type='stadium']       { polygon-fill: @sports; }
    [type='university']    { polygon-fill: @school; }
    [type='wood']          { polygon-fill: @wooded; 
    						 polygon-opacity: 0.3}
    [type='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.3;
        //marker-file: url(park2-12.svg);
      }
    [type='water'],[type='reservoir']	   
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
  }
}

#naturalsimpl2 [zoom>=6][zoom<10][area > 500000]
{
    [type='forest']        { polygon-fill: @wooded; }
    [type='park']          { polygon-fill: @park; }
    [type='water'],[type='riverbank']	   
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
}

#naturalsimpl1 [zoom>=10][zoom<12][area > 100000]
{
    [type='forest']        { polygon-fill: @wooded; }
    [type='park']          { polygon-fill: @park; }
    [type='water'],[type='riverbank']
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
}

#natural [zoom>=12][zoom<14][area > 1000]
{
    [type='forest']        { polygon-fill: @wooded; }
    [type='park']          { polygon-fill: @park; }
    [type='water'],[type='riverbank']	   
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
}
 
#natural [zoom>=14] 
{
    [type='forest']        { polygon-fill: @wooded; }
    [type='park']          { polygon-fill: @park; }
    [type='water'],[type='riverbank']   
    { 
      polygon-fill: @water; 
 	   ::outline {
    	line-color: darken(@water,25%);
    	line-width: 1.0;
    	line-join: round;
      	}
    }
}

// ---- BUILDINGS ----

#buildings
{
  [zoom>=16][area>10],
    [zoom>=18][area<=10]
  {
	  polygon-fill:@building;
      ::outline {
      line-color: darken(@building,65%);
      line-width: 1.0;
      line-join: round;
    }
  }
}

//building icons
#buildings {
    [zoom>=17][area>10],
    [zoom>=18][area<=10] 
    {
    [type='church'], [type='chapel'] {
    marker-file: url(religious-christian-24.svg); 
    [zoom>=18] {marker-file: url(religious-christian-24.svg);
        }
    }
    [type='university'] {
    marker-file: url(college-24.svg);
    [zoom>=18] {marker-file: url(college-24.svg);
        }
    }
    [type='school'] {
    marker-file: url(school-24.svg); 
    }
    [type='public'] {
    marker-file: url(town-hall-24.svg);
    [zoom>=18] {marker-file: url(town-hall-24.svg);
        }
    }  
  }  
}


//pitch-18.svg, rail-18.svg
//rail-above-24.svg, rail-light-18.svg, rail-metro-18.svg, religious-christian-18.svg
//zoo-18.svg

#points [zoom>=17] {
  [type='hospital'] {
  marker-file: url(hospital-24.svg);
  marker-fill: red;
	}
  [type='bus_stop'] {
  marker-file: url(bus-24.svg);
	}
  [type='emergency_telephone'] {
  marker-file: url(telephone-24.svg);
	}
  [type='fuel'] {
  marker-file: url(fuel-24.svg);
	}
  [type='parking'] {
  marker-file: url(parking-24.svg);
	}
  [type='park'] {
  marker-file: url(park2-24.svg);
  	}
}
//consider adding icons for other types of buildings ‘yes’, 
//hangar, apartments, house, 

// ==================================================================
// WATER WAYS
// ==================================================================

#waterwayssimpl1[zoom>=10][zoom<14] {
  line-color: @water;
  line-width: 1.2;
  }
#waterways[zoom>=14]{
  line-color: @water;
  line-width: 2.0;
  ::case {
    line-color: darken(@water,25%);
    line-width: 0.3;
    line-join: round;
      }
}


// ==================================================================
//   ROAD & RAIL LINES
// ==================================================================

// At lower zoomlevels, just show major automobile routes: motorways and trunks.


#roadssimpl2[zoom>=9][zoom<11] {
  [type='motorway'] { line-color: @motorway_line; line-width: 1.0 }
  [type='trunk'] { line-color: @trunk_line; line-width: 1.0 }
}

// At mid-level scales start to show primary and secondary routes as well.

#roadssimpl1[zoom>=11][zoom<17]
{
  [type='motorway'] {
   line-color: @motorway_line;
  }
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'] {
    line-color: @trunk_line;
  }
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; line-width: 2.5; }
  [type='secondary'] { line-color: @secondary_line; line-width: 2}
  [type='tertiary'] { line-color: @standard_line; line-width: 1 }
}

#roadssimpl1[zoom>=14][zoom<17]
{
  [type='primary'] { line-color: @primary_line; line-width: 2.5; }
//  [type='secondary'] { line-color: @secondary_line; line-width: 2}
//  [type='tertiary'] { line-color: @standard_line; line-width: 1 }
}

#roadssimpl1[zoom>=15][zoom<17]
{
  [type='secondary'] { line-color: @secondary_line; line-width: 2}
//  [type='tertiary'] { line-color: @standard_line; line-width: 1 }
}

#roads[zoom>=17]
{
  [type='motorway'] {
   line-color: @motorway_line;
  }
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'] {
    line-color: @trunk_line;
  }
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; line-width: 2.5; }
  [type='secondary'] { line-color: @secondary_line; line-width: 2}
  [type='tertiary'] { line-color: @standard_line; line-width: 1 }
  [type="residential"],
    [type="unclassified"],
    [type="service"],
    [type="secondary_link"],
    [type="tertiary_link"],
    [type="living_street"]
    {
    line-color: @standard_line; line-width: 1;
    }
}

#roads[zoom>=18]
{
    [type="cycleway"],
    [type="footway"],
    [type="unsurfaced"],
    [type="track"]    
    {
    	line-color: @standard_line; line-width: 1;
    }
}

#railwayssimpl1[zoom>10][zoom<12]
{
  [type="rail"] {
    	line-color: @rail_line; 
    	line-width: 1; 
  }
}

#railways[zoom>=12]
{
    [type="rail"] {
    	line-color: @rail_line; 
    	line-width: 1; 
    }
    [type="subway"],
    [type="tram"],
    [type="preserved"],
    [type="narrow_guage"],
    [type="light_rail"]
    [zoom > 12] {
    	line-color: @rail_line; line-width: 2;}
}

// ================================================================== */
// AEROWAYS
// ================================================================== */

//**May want to add icons for airports**
#aeroway[zoom>10] {
    [TYPE='runway'] { 
    line-width: 3;
  	line-color:@aeroway;
    }
    [zoom>12][TYPE='taxiway'] {
    line-width: 2;
  line-color:@aeroway;
  }
}

#aeroway [zoom > 10] {
    marker-file: url(airport-24.svg); 
}

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#places [zoom>12] {
    text-name:'[name]';
    text-placement: point;
    text-face-name:@sans_lt;
  	text-halo-fill: fadeout(white, 30%);
  	text-halo-radius: @text_halo;
   } 

// ==================================================================
// ADMINISTRATIVE BOUNDARIES & LABELS
// ==================================================================

//National Border

#adminline2 [zoom>=4] {
  [ADMIN_LEVE="2"] {
  line-color:@admin_2;
  line-width:0.5;
  line-join: round;
    }
}

//Country Label

#places [zoom<=4] {
  [type="country"]{
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: @text_halo;
  text-size:24;
  text-wrap-width: 40;
	}
}

//Regions

#adminline [zoom>=5][zoom<9] {
  [ADMIN_LEVE="3"] {
  line-color:@admin_2;
  line-width:0.5;
  line-join: round;
   } 
} 

//States

#adminline [zoom>=5][zoom<9] {
  [ADMIN_LEVE="4"] {
  line-color:@admin_2;
  line-width:0.5;
  line-join: round;
    }
} 

//State names for zoom level 5

#places[type="state"][zoom>=5][zoom<9]
{
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: @text_halo;
  text-size:12;
  text-align:center;
  [name="Rondônia"] {
  text-dx:-0.6px;}
  [name="Santa Catarina"] {
  text-dy:-0.5px;}
  [name="Goiás"] {
  text-dy:18px;}
}

#places[type="state"][zoom>=5][zoom<9]
{
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: @text_halo;
  text-size:15;
  text-align:center;
  [name="Amapá"] {
  text-dy:10px;}
  [name="Pará"] {
  text-dy:18px;}
}

/*metropolitan areas look crowded
#adminline[ADMIN_LEVE="6"][zoom>=6][zoom<11] {
  line-color:@admin_2;
  line-width:6;
}
//admin level 4 is meso regions, 5 is metropolitan areas, 6 is micro-regions
//7 is municipalities, 8 is districts, 9 is suburbs and neighborhoods
//info not needed for current map purpose
//place info includes names,population,admin-leve
*/

#places [zoom>=9]
{
  [type="city"] {
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill: @city_halo;
  text-halo-radius: @text_halo;
  text-size:12;
  }
}


#places [zoom>=6] [zoom < 11] [type="city"] { 
  ['name'="São Paulo"] {
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
  ['name'="Rio de Janeiro"] {
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
  ['name'="Salvador"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
   ['name'="Fortaleza"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
   ['name'="Belo Horizonte"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
   ['name'="Curitiba"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
   ['name'="Recife"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
   ['name'="Porto Alegre"]{
    marker-fill:#E65C5C;
    marker-width:5px;
  	marker-height:5px;
    text-name:'[name]';
    text-face-name:@sans_bold;
    text-fill:@city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: @text_halo;
    text-size:12;
    text-dx:7px;}
}

// ==================================================================
// MISC LABELS FLOAT ON TOP
// ==================================================================


#waterways [zoom>=14]{
  text-name:'[name]';
  text-placement: line;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
  text-min-distance: 9px;
}

#natural [zoom>=16]{
    text-name:'[name]';
    text-placement: point;
	//marker-fill:black;
    //marker-width:2px;
  	//marker-height:2px;
    [type='riverbank'] {
      text-placement: line;
   	}
    text-face-name:@sans_lt;
    text-halo-fill: fadeout(white, 30%);
    text-halo-radius: @text_halo;
 }

#railways [zoom>=14]{
    text-name:'[name]';
    text-placement: line;
    text-face-name:@sans_lt;
    text-halo-fill: fadeout(white, 30%);
    text-halo-radius: @text_halo;
 }

#roads [zoom>=16]{
    text-name:'[name]';
    text-placement: line;
    text-face-name:@sans_lt;
    text-halo-fill: fadeout(white, 30%);
    text-halo-radius: @text_halo; 
  	text-min-distance: 5;
 }

#buildings [zoom>=16] {
  [type='railway_station'], [type='train_station'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(rail-24.svg); 
  }
  [type='cathedral'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(place-of-worship-24.svg); }
  [type='police'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(police-24.svg); }
  [type='museum'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(museum-24.svg); }
  [type='ferry_terminal'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(ferry-24.svg); }
  [type='hospital'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(hospital-24.svg); 
  	marker-fill: red;}
  [type='bus_station'] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
    marker-file: url(bus-24.svg); }
}

#buildings [zoom>=18] {
  text-name:'[name]';
  text-placement: point;
  text-face-name:@sans_lt;
  text-halo-fill: fadeout(white, 30%);
  text-halo-radius: @text_halo;
  [type='church'], [type='chapel'] {
    marker-file: url(religious-christian-24.svg); }
  [type='places_of_worship'] {
    marker-file: url(place-of-worship-24.svg); }
  [type='school'] {
    marker-file: url(school-24.svg); }
  [type='college'], [type='university'] {
    marker-file: url(college-24.svg); }
  [type='toilets'] {
    marker-file: url(toilets-24.svg); }
  [type='fuel'] {
    marker-file: url(fuel-24.svg); }
  [type='nightclub'] {
    marker-file: url(bar-24.svg); }
  [type='library'] {
    marker-file: url(library-24.svg); }
  [type='parking'] {
    marker-file: url(parking-24.svg); }
  //[type='apartments'] {
  //  marker-file: url(); }
  [type='public_building'], [type='public'] {
    marker-file: url(town-hall-24.svg); }
  [type='restaurant'] {
    marker-file: url(restaurant-24.svg); }
  [type='bicycle_parking'] {
    marker-file: url(bicycle-24.svg); }
  [type='hotel'] {
    marker-file: url(lodging-24.svg); }
  [type='commercial'] {
    marker-file: url(commercial-24.svg); }
  //[type='transportation'] {
  //  marker-file: url(); }
  [type='fast_food'] {
    marker-file: url(fast-food-24.svg); }
  [type='theatre'] {
    marker-file: url(theatre-24.svg); }
  [type='marketplace'], [type='supermarket'] {
    marker-file: url(grocery-24.svg); }
  //[type='attraction'] {
  // marker-file: url(); }
  [type='arts_centre'], [type='studio'] {
    marker-file: url(art-gallery-24.svg); }
  //[type='hangar'] {
  //  marker-file: url(); }
  //[type='station'] {
  //  marker-file: url(); }
}
