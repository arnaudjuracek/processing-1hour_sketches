## 1 HOUR SKETCHES
`Quick, dirty, poorly named Processing sketches inspired by various things.`
![preview](2016-02-27_lines-by-brightness/preview_1.png?raw=true "preview")

-
```bash
function 1hour(){
    #replace space by dash
	NAME=${1// /-};
	
	DATE=$(date +"%Y-%m-%d");
	DIRNAME="$DATE"_"$NAME";
	DIR=/Users/RNO/Documents/Processing/1-hour/$DIRNAME;
	
	#creating directories
	mkdir $DIR;
	mkdir $DIR/sketch;
	
	#using https://github.com/jdberry/tag/
	tag -a "Work in Progress" $DIR;
	
	#allows quick manipulation via Terminal
	cd $DIR;
	
	#creating files
	echo -e "![preview](preview.gif?raw=true "preview")\n-\n*Arnaud Juracek*, \`GNU GENERAL PUBLIC LICENSE Version 2, June 1991\`" > $DIR/README.md;
	echo -e "/**\n * $NAME\n * by Arnaud Juracek\n * $DATE\n *\n * https://github.com/arnaudjuracek/processing-1hour_sketches/tree/master/$DIRNAME\n */\n\n\nvoid setup(){\n\tsize(800, 800, P2D);\n}\n\nvoid draw(){\n\t\n}" > $DIR/sketch/sketch.pde;
	
	#opening apps
	open -a Finder $DIR;
	open -a "Sublime Text 2.app" $DIR;
	
	#using https://github.com/busyloop/lolcat
	echo "1-hour/$DIRNAME created and ready."| lolcat;
}
```
-
*Arnaud Juracek*, `GNU GENERAL PUBLIC LICENSE Version 2, June 1991`
