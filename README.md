# imgPrep

Scripts to export images for web: thumbs and scrsets for @1.5x @2x @3x @4x pixel density screens.

WebP images in my case are 3-5 times smaller with tolerable outcomes. 

SRCSET most noticeable improvement is the handling of small icons. At first glance, it appears to be tricky why 24x24 icon appears unforgivingly blurry on 4k screen. The browser still will tell you it's a 24x24 block. But that might not be true. You can take a screenshot, zoom in, and find out for yourself that the browser actually adjusts for your screen resolution: 24 is actually 36 if your resolution is 1.5x. Feeding the browser 24x24 image for 24x24 box in this case is wrong and looks wrong, you'll need to provide 36x36. Another way to handle it is to feed it the biggest size you have, but it's not exactly a nice thing to do. You can export all sizes in Photoshop: "export as" on the large image, enter 1x size for it, then add "Size:" 2x, 3x, 4x options on the left... -- for each image on every edit. Or you can spend some time on installing ImageMagic setup and scrips for HTML generation.

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
