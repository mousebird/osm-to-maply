/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

Map {
  background-color: #b8dee6;
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

#braziloutline [zoom < 9] {
  polygon-fill: white
}

#brazilland2 [zoom >= 9] {
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

#landuselow
{
  [zoom>=6][zoom<8][AREA > 1000000000],
  {
    [TYPE='cemetery']      { polygon-fill: @cemetery; }
    [TYPE='college']       { polygon-fill: @school; }
    [TYPE='commercial']    { polygon-fill: @industrial; }
    [TYPE='common']        { polygon-fill: @park; }
    [TYPE='forest']        { polygon-fill: @wooded; }
    [TYPE='golf_course']   { polygon-fill: @sports; }
    [TYPE='grass']         { polygon-fill: @grass; }
    [TYPE='hospital']      { polygon-fill: @hospital; }
    [TYPE='industrial']    { polygon-fill: @industrial; }
    [TYPE='park']          { polygon-fill: @park; }
    [TYPE='parking']       { polygon-fill: @parking; }
    [TYPE='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [TYPE='pitch']         { polygon-fill: @sports; }
    [TYPE='residential']   { polygon-fill: @residential; }
    [TYPE='school']        { polygon-fill: @school; }
    [TYPE='sports_center'] { polygon-fill: @sports; }
    [TYPE='stadium']       { polygon-fill: @sports; }
    [TYPE='university']    { polygon-fill: @school; }
    [TYPE='wood']          { polygon-fill: @wooded; }
    [TYPE='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.5;
      }
  }
}

#landusemed
{
  [zoom>=8][zoom<10][AREA > 10000000]
  {
    [TYPE='cemetery']      { polygon-fill: @cemetery; }
    [TYPE='college']       { polygon-fill: @school; }
    [TYPE='commercial']    { polygon-fill: @industrial; }
    [TYPE='common']        { polygon-fill: @park; }
    [TYPE='forest']        { polygon-fill: @wooded; }
    [TYPE='golf_course']   { polygon-fill: @sports; }
    [TYPE='grass']         { polygon-fill: @grass; }
    [TYPE='hospital']      { polygon-fill: @hospital; }
    [TYPE='industrial']    { polygon-fill: @industrial; }
    [TYPE='park']          { polygon-fill: @park; }
    [TYPE='parking']       { polygon-fill: @parking; }
    [TYPE='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [TYPE='pitch']         { polygon-fill: @sports; }
    [TYPE='residential']   { polygon-fill: @residential; }
    [TYPE='school']        { polygon-fill: @school; }
    [TYPE='sports_center'] { polygon-fill: @sports; }
    [TYPE='stadium']       { polygon-fill: @sports; }
    [TYPE='university']    { polygon-fill: @school; }
    [TYPE='wood']          { polygon-fill: @wooded; }
    [TYPE='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.5;
      }
  }
}

#landusehigh
{
  [zoom>=10][zoom<12][AREA > 1000000]
  {
    [TYPE='cemetery']      { polygon-fill: @cemetery; }
    [TYPE='college']       { polygon-fill: @school; }
    [TYPE='commercial']    { polygon-fill: @industrial; }
    [TYPE='common']        { polygon-fill: @park; }
    [TYPE='forest']        { polygon-fill: @wooded; }
    [TYPE='golf_course']   { polygon-fill: @sports; }
    [TYPE='grass']         { polygon-fill: @grass; }
    [TYPE='hospital']      { polygon-fill: @hospital; }
    [TYPE='industrial']    { polygon-fill: @industrial; }
    [TYPE='park']          { polygon-fill: @park; }
    [TYPE='parking']       { polygon-fill: @parking; }
    [TYPE='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [TYPE='pitch']         { polygon-fill: @sports; }
    [TYPE='residential']   { polygon-fill: @residential; }
    [TYPE='school']        { polygon-fill: @school; }
    [TYPE='sports_center'] { polygon-fill: @sports; }
    [TYPE='stadium']       { polygon-fill: @sports; }
    [TYPE='university']    { polygon-fill: @school; }
    [TYPE='wood']          { polygon-fill: @wooded; }
    [TYPE='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.5;
      }
  }
}

#landuse
{
  [zoom>=12]
  {
    [TYPE='cemetery']      { polygon-fill: @cemetery; }
    [TYPE='college']       { polygon-fill: @school; }
    [TYPE='commercial']    { polygon-fill: @industrial; }
    [TYPE='common']        { polygon-fill: @park; }
    [TYPE='forest']        { polygon-fill: @wooded; }
    [TYPE='golf_course']   { polygon-fill: @sports; }
    [TYPE='grass']         { polygon-fill: @grass; }
    [TYPE='hospital']      { polygon-fill: @hospital; }
    [TYPE='industrial']    { polygon-fill: @industrial; }
    [TYPE='park']          { polygon-fill: @park; }
    [TYPE='parking']       { polygon-fill: @parking; }
    [TYPE='pedestrian']    { polygon-fill: @pedestrian_fill; }
    [TYPE='pitch']         { polygon-fill: @sports; }
    [TYPE='residential']   { polygon-fill: @residential; }
    [TYPE='school']        { polygon-fill: @school; }
    [TYPE='sports_center'] { polygon-fill: @sports; }
    [TYPE='stadium']       { polygon-fill: @sports; }
    [TYPE='university']    { polygon-fill: @school; }
    [TYPE='wood']          { polygon-fill: @wooded; }
    [TYPE='nature_reserve'] 
      { polygon-fill: darken(@wooded,25%);
        polygon-opacity: 0.5;
      }
  }
}

// ---- BUILDINGS ----

#buildings
{
  [zoom>=12][AREA>30000],
    [zoom>=14][AREA<=30000]
  {
	  polygon-fill:@building;
  }
}

// ==================================================================
// WATER AREAS
// ==================================================================

#waterlow
{
  [zoom>=6][zoom<8][AREA > 1000000000]
    {
    polygon-fill: @water;
    }
}

#watermed
{
  [zoom>=8][zoom<10][AREA > 10000000]
    {
    polygon-fill: @water;
    }
}

#water
{
  [zoom>=10]
    {
    polygon-fill: @water;
    }
}


// ==================================================================
// WATER WAYS
// ==================================================================

#waterwaylow[zoom>=8],
#waterwayhigh[zoom>=12]{
  line-color: @water;
  line-width: 1.0;
}


// ==================================================================
// ADMINISTRATIVE BOUNDARIES
// ==================================================================

#admin_line[ADMIN_LEVE="2"][zoom<4] {
  line-color:@admin_2;
  line-width:2;
}
#place[TYPE="country"][zoom<4]
{
  text-name:'[NAME]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-size:24;
  text-wrap-width: 40;
}

#adminline[ADMIN_LEVE="3"][zoom>=4][zoom<6] {
  line-color:@admin_2;
  line-width:2;
} 
#place[TYPE="state"][zoom>=4][zoom<7]
{
  text-name:'[NAME]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-size:12;
  text-wrap-width: 40;
}

#admin_line[ADMIN_LEVE="4"][zoom>=6][zoom<8] {
  line-color:@admin_2;
  line-width:2;
} 
#place[TYPE="city"][zoom>=7]
{
  text-name:'[NAME]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-size:12;
  text-wrap-width: 40;
}

#admin_line[ADMIN_LEVE="5"][zoom>=8][zoom<11] {
  line-color:@admin_2;
  line-width:2;
} 
#place[TYPE="town"][zoom>=10]
{
  text-name:'[NAME]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-size:12;
  text-wrap-width: 40;
}

#place[TYPE="village"][zoom>=11]
{
  text-name:'[NAME]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-size:12;
  text-wrap-width: 40;
}



// ==================================================================
//   ROAD & RAIL LINES
// ==================================================================

// At lower zoomlevels, just show major automobile routes: motorways and trunks.


#roadslow[zoom>=6] 
{
  [TYPE='motorway'] { line-color: @motorway_line; line-width: 1.0 }
  [TYPE='trunk'] { line-color: @trunk_line; line-width: 1.0 }
}

// At mid-level scales start to show primary and secondary routes as well.

#roadsmed[zoom>=9] 
{
//  [type='motorway'],
  [TYPE='motorway_link'] {
    line-color: @motorway_line;
  }
//  [type='trunk'],
  [TYPE='trunk_link'] {
    line-color: @trunk_line;
  }
  [TYPE='primary'] { line-color: @primary_line; line-width: 3; }
  [TYPE='secondary'] { line-color: @secondary_line; line-width: 2}
  [TYPE='tertiary'] { line-color: @standard_line; line-width: 1 }
}

#roadshigh[zoom>=13]
{
  [TYPE="residential"],
    [TYPE="unclassified"],
    [TYPE="service"],
    [TYPE="secondary_link"],
    [TYPE="tertiary_link"],
    [TYPE="living_street"]
    {
    line-color: @standard_line; line-width: 1;
    }
}

#roadshigh[zoom>14]
{
    [TYPE="cycleway"],
    [TYPE="footway"],
    [TYPE="unsurfaced"],
    [TYPE="track"]    
    {
    	line-color: @standard_line; line-width: 1;
    }
}

#roadshigh[zoom>10]
{
  [RAILWAY="rail"],
    {
    	line-color: @rail_line; line-width: 2;
    }
}

#roadshigh[zoom>12]
{
    [RAILWAY="subway"],
    [RAILWAY="tram"],
    [RAILWAY="preserved"],
    [RAILWAY="narrow_guage"],
    [RAILWAY="light_rail"]
    {
    	line-color: @rail_line; line-width: 2;
    }
}

// At higher levels the roads become more complex. We're now showing 
// more than just automobile routes - railways, footways, and cycleways
// come in as well.

// Road width variables that are used in road & bridge styles
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

// ---- Casing -----------------------------------------------

// ================================================================== */
// AEROWAYS
// ================================================================== */

#aeroway[zoom>9] {
  [TYPE='runway'] {
    line-width: 3;
  line-color:@aeroway;
  }
  
  [zoom>12][TYPE='taxiway'] {
    line-width: 2;
  line-color:@aeroway;
  }
}

/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* Mapnik does not yet support character-spacing adjustments for 
   labels placed along a line. We can fake this using the replace()
   function in the text-name parameter by replacing each character
   with itself followed by one or more spaces. */

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */


/*
#place::country[type='country'][zoom>3][zoom<9] {
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  [zoom=3] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=4] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>4] {
    text-halo-radius: 2;
  }
  [zoom=5] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=6] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=7] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

#place::state[type='state'][zoom>=5][zoom<=10] {
  text-name:'[name]';
  text-face-name:@sans_bold_italic;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 1;
  [zoom=6] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=7] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>8] {
    text-halo-radius: 2;
  }
  [zoom=8] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}
*/

/* ---- Cities ------------------------------------------------------ */

#place::city[TYPE='city'][zoom>=8][zoom<=15] {
  text-name:'[NAME]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:2;
  [zoom<=8] {
    text-size: 10;
    text-halo-radius:1;
  }
  [zoom=9] {
    text-size:10;
    text-wrap-width: 60;
  }
  [zoom=10] {
    text-size:11;
    text-wrap-width: 70;
  }
  [zoom=11] {
    text-size:12;
    text-character-spacing: 1;
    text-wrap-width: 80;
  }
  [zoom=12] {
    text-size:13;
    text-character-spacing: 1;
    text-wrap-width: 100;
  }
  [zoom=13] {
    text-size:14;
    text-character-spacing: 2;
    text-wrap-width: 200;
    text-transform: uppercase;
  }
  [zoom=14] {
    text-size:15;
    text-character-spacing: 4;
    text-wrap-width: 300;
    text-transform: uppercase;
  }
  [zoom=15] {
    text-size:16;
    text-character-spacing: 6;
    text-wrap-width: 400;
    text-transform: uppercase;
  }
}

/* ---- Towns ------------------------------------------------------- */

#place::town[TYPE='town'][zoom>=9][zoom<=17] {
  text-name:'[NAME]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:9;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  [zoom>=10] {
    text-halo-radius:2;
    text-size: 10;
  }
  [zoom>=11]{ text-size:11; }
  [zoom>=12]{
    text-size:12;
    text-line-spacing: 1;
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=14]{
    text-size:13;
    text-character-spacing: 2;
    text-line-spacing: 3;
  }
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

/* ---- Other small places ------------------------------------------ */

#place::small[TYPE='village'][zoom>=13],
#place::small[TYPE='suburb'][zoom>=13],
#place::small[TYPE='hamlet'][zoom>=13],
#place::small[TYPE='neighbourhood'][zoom>=13] {
  text-name:'[NAME]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:10;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=14] {
    text-size:11;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-size:12;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  [zoom>=17] {
    text-size:13; 
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place::small[TYPE='locality'][zoom>=15] {
  text-name:'[NAME]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=16] {
    text-size:10;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}

// =====================================================================
// AREA LABELS
// =====================================================================
/*
#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=10][area>102400000],
  [zoom>=11][area>25600000],
  [zoom>=13][area>1600000],
  [zoom>=14][area>320000],
  [zoom>=15][area>80000],
  [zoom>=16][area>20000],
  [zoom>=17][area>5000],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
      text-face-name: @sans_lt_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10);
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10);
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10);
    }
    [type='college'][zoom>=10],
    [type='school'][zoom>=10],
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10);
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10);
    }
  }
  [zoom=15][area>1600000],
  [zoom=16][area>80000],
  [zoom=17][area>20000],
  [zoom=18][area>5000] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
    text-halo-radius: 2;
  }
  [zoom=16][area>1600000],
  [zoom=17][area>80000],
  [zoom=18][area>20000] {
    text-size: 15;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
  [zoom>=17][area>1600000],
  [zoom>=18][area>80000] {
    text-size: 20;
    text-character-spacing: 3;
    text-wrap-width: 180;
  }
}
   
#poi[type='university'][zoom>=15],
#poi[type='hospital'][zoom>=16],
#poi[type='school'][zoom>=17],
#poi[type='library'][zoom>=17] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10;
  text-wrap-width:30;
  text-fill: @poi_text;
}
*/

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */
/*


/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */
