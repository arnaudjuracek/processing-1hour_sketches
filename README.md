## 1 HOUR SKETCHES
`Quick, dirty, poorly named Processing sketches inspired by various things.`
![preview](2016-02-27_lines-by-brightness/preview_1.png?raw=true "preview")

-
**Awesome** bash function for creating ready-to-code template :
```
function 1hour(){
    DATE=$(date +"%Y-%m-%d");
    NAME=${1// /-};
    DIR="$DATE"_"$NAME";
    cd /Users/RNO/Documents/Processing/1-hour/;
    mkdir $DIR;
    tag -a "Work in Progress" $DIR;
    cd $DIR;
    mkdir /Users/RNO/Documents/Processing/1-hour/$DIR/sketch;
    echo -e "![preview](preview.gif?raw=true "preview")\n-\n*Arnaud Juracek*, \`GNU GENERAL PUBLIC LICENSE Version 2, June 1991\`" > /Users/RNO/Documents/Processing/1-hour/$DIR/README.md;
    echo -e "/**\n * $NAME\n * by Arnaud Juracek\n * $DATE\n *\n * https://github.com/arnaudjuracek/processing-1hour_sketches/tree/master/$DIR\n */\n\n\nvoid setup(){\n\tsize(800, 800, P2D);\n}\n\nvoid draw(){\n\t\n}" > /Users/RNO/Documents/Processing/1-hour/$DIR/sketch/sketch.pde;
    open -a Finder /Users/RNO/Documents/Processing/1-hour/$DIR;
    open -a "Sublime Text 2.app" /Users/RNO/Documents/Processing/1-hour/$DIR;
    echo "1-hour/$DIR created and ready."| lolcat;
}
```
-
*Arnaud Juracek*, `GNU GENERAL PUBLIC LICENSE Version 2, June 1991`
