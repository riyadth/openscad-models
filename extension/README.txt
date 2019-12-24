                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


https://www.thingiverse.com/thing:2805184
SVG to OpenSCAD Bezier - InkScape extension by gaellafond is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

This InkScape extension (plugin) can be used to convert any **SVG** files to native **OpenSCAD** code, with full **Bezier** support. The global variable ```$fn``` can be used to tweak the resolution of the curves.

Generated OpenSCAD files contains a stripped down version of my OpenSCAD Bezier library:
https://www.thingiverse.com/thing:2170645

The Cat SVG file used for the demonstration of the library is from:
https://www.onlinewebfonts.com/icon/74146

**[2018-02-25]** Check if element is empty before adding it to the OpenSCAD file

**[2018-03-01]** Re-uploaded the ZIP file. Fixed issues with holes. Unfortunately, I can't use the polygon drawing direction to determine if the polygon is a hole or not because the simplepath library do not respect the drawing direction when converting paths. I had to use a logic of "Paths inside path are holes". There is still a possibility of some SVG files not converting well, but they are exception cases that are very unlikely to happen.

**[2018-03-03]** Fixed bug caused by polygons composed of a single point.

**[2018-04-02]** Added support for InkScape layers, as suggested by Warren Baird: https://www.thingiverse.com/thing:2805184/#comment-1837500

**[2018-06-17]** Fixed bug causing parts of multi-part polygon to be missing.
Fixed Python error caused by missing library when attempting to display warning messages.
Added "translate" to center the drawing, as suggested by Jon Briggs (spinvector) and Anton Moiseev (sadr0b0t)

**[2018-06-29]** Fixed bug with the "translate" function, when document is not in Pixel unit.

# Instructions

## Installation

1. Download the included Zip file
2. Extract its content
3. Copy the 2 extracted files in InkScape extensions folder:
    Linux & Mac OSX: **~/.config/inkscape/extensions/**
    Windows: **C:/Program Files/Inkscape/share/extensions**


## Usage

1. Open any SVG file in InkScape
2. File > Save as
3. Select file type "OpenSCAD Bezier (*.scad)"
4. Open the scad file in OpenSCAD
5. Set the ```$fn``` variable to change the precision if desired and extrude the 2D shape

See included photos for more information

## Limitations

* Colours are ignored. The purpose of this tool is to generate STL files which can be 3D printed. Colours are irrelevant for this purpose.
* Text and strokes are ignored. The SVG document needs to be converted into Path to work with those.

## Converting SVG to Path

If you found a SVG file that is not converting properly, try the following:
1. Open the SVG in InkScape
2. Select everything (Ctrl + A)
3. Convert everything to Path using menu Path > Object to Path (Shift + Ctrl + C)
4. Save as "OpenSCAD Bezier (*.scad)"

If your SVG file is still not converting properly, please send it to me so I can reproduce the issue and fix it in the library.