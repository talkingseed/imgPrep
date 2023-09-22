# imgPrep

Scripts to export images for web: thumbs and scrsets for @1.5x @2x @3x @4x pixel density screens.

Requirement: ImageMagic already installed. On Windows works in GitBash.

Structure of image folder for scaled images

```
├── imgDir
│   ├── formatted
│   ├── originals
```

Later to be used in

        <img alt="box.com"
          srcset="./employer_logo/box.jpg, ./employer_logo/box@1.5x.jpg 1.5x, ./employer_logo/box@2x.jpg 2x, ./employer_logo/box@3x.jpg 3x, , ./employer_logo/box@4x.jpg 4x"
          src="/employer_logo/box.jpg">

Structure of image folder for thumbs and webp images

```
├── imgDir
│   ├── thumbs
│   ├── webp
│   ├── originals
```

Later to be used in

        <?php
        $memes = glob("./memes/thumbs/*");
        usort($memes, function($a, $b) {
          return filemtime($b) - filemtime($a);
        });
        foreach ($memes as $filename) {
            echo '<li tabindex="0"><img title="" src="' . $filename . '" /></li>' . "\n";
        }
        ?>
