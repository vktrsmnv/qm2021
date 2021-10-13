---
title: "Doing References in RMarkdown"
authors:
- admin
- viktoriia
date: "2021-10-14"
menu:
  misc:
    parent: "Misc"
    weight: 1
#shiny: true
toc: true
subtitle: ' '
summary: ' '
---


Doing references is not very complicated in Rmarkdown. One option is to struggle and do everything manually, but there is a much better way that is quicker and more reliable.

# Getting Started

To start with, you will need a file that contains all the bibliographic information about the texts you are using for writing (you can update it any time you want). The file can be in different formats, but I suggest you use the `bib` format, which is supported by most reference managers and is primarily used when working with typesetting software *Latex*. The `bib` file will have one or many entries like this, one for each article/book/etc. you add:


    @article{king2000making,
      title={Making the most of statistical analyses: Improving interpretation and presentation},
      author={King, Gary and Tomz, Michael and Wittenberg, Jason},
      journal={American journal of political science},
      pages={347--361},
      year={2000}
    }


There is a unique identifier of the item, `king2000making` in this case, as well as the normal bibliographic information like the title and year of publication. There are various types of items, like articles or books.

The good news is: you don't need to write these files yourself. Programs like reference managers will do this for you. All you have to do to get these files is to put the URLs or [DOI (Digital Object Identifier)](https://library.uic.edu/help/article/1966/what-is-a-doi-and-how-do-i-use-them-in-citations) numbers of articles or International Standard Book Number (ISBN) of books into the programs and check that the imported details look correct/reasonable. The even better news is that based on these details, you will only need to mention the unique identifier of the item (like `king2000making`) when writing the text and RMarkdown will make an citation and a reference according to the citation style you select. 

# Step 1: Get a `bib` File

If you are already using any reference manager like Zotero or Mendeley, enter the texts you need into the manager as normal and export the `bib` (`Bibtex`) file into the project directory (where your `Rproj` file is located). Here is a way to do it in [Zotero](https://unimelb.libguides.com/latexbibtex/zotero) and in [Mendeley](https://www.imperial.ac.uk/media/imperial-college/administration-and-support-services/library/public/LaTeX-and-Mendeley-apr-2019.pdf). 

If you have never used a reference manager, you can either install one or use a web-version of Zotero <https://zbib.org/> to generate a `bib` file. Put the URLs to the articles or the DOI numbers. If necessary, you can enter the details manually.  Always check if the imported data look correct: sometimes, page numbers look weird or the titles are not imported correctly. This happens relatively rare, but better always double-check. Scroll to export and select *Download Bibtex*. Put this `bib` file into the project directory (where your `Rproj` file is located).

You can check if `bib` file has data and open in Rstudio by clicking on it from the Files pane (or a text editor that supports `txt` files).

# Step 2: Add Bibliography-related Parameters to YAML in `Rmd` file

Now you need to tell RMarkdown that you will want it to use this `bib` file. Let's say you now have the `citations.bib` file in the folder of the project folder and your `Rmd` file is located there as well. In the YAML header, you will need to add the following lines and I want Chicago-style in-text citations:

``` {.md}
bibliography: citations.bib
biblio-style: apsr
```

`bibliography` parameter tells R which file to use and `biblio-style` defines the style. Style *apsr* is the style used in American Political Science Review, and this is the Chicago author-date style.

In case you need to use a very specific style that is not built-in, it will probably be available here: <https://github.com/citation-style-language/styles>. Styles are saved in `csl` files, so you will just need to download the file you need, put it in the project folder, and instead of `biblio-style` put `csl` parameter with the name of the respective file. For instance, if I wanted to use the style of *American Political Science Association*, I would write it like this if saved the `csl` file as `american-political-science-association.csl`:

``` {.md}
bibliography: citations.bib
csl: american-political-science-association.csl
```

You can download the latest version of Mannheim Political Science group citation style from the library website: <https://www.bib.uni-mannheim.de/services/literaturverwaltungsprogramme/zitationsstile/>.

# Step 3: Add *References* Section to the Document

The bibliography is typically placed at the end of the document, so your last heading should be something like `# References`.

# Step 4: Reference Items in the Text


If you are using the Visual markdown editor mode, *Insert -> Citation*  will do most of the job. You just need to find the text you want to cite and the citation will be inserted at the place you selected. If you need something like *Blah blah (Smith 2004)*, just select the text from the list and you're good. If you want the format: *Smith (2004) claims blah ...* select the *in-text citation* option. 

If you're using source editor, you will need to write out the references manually. Each item in your `bib` list can be referenced in the main text, so you will need to see these identifiers. I just have the `bib` file opened in a tab in Rstudio and check the identifier once I need it.  

Citations go inside square brackets and are separated by semicolons. Each citation must have a key, composed of '\@' + the citation identifier from the database, and may optionally have a prefix, a locator, and a suffix. Putting `[]` ensures that there are parenthesis around the citation. 

``` {.md}
Blah blah [see @doe99, pp. 33-35; also @smith04, ch. 1].

Blah blah [@smith04; @doe99].
```

A minus sign `-` before the `@` will suppress mention of the author in the citation. This can be useful when the author is already mentioned in the text and you only need to include the year:

```{.md}
Smith says blah [-@smith04].
```

This is how you get the in-text citations like *Smith (2004) says blah* and *Smith (2004, 33) says blah*.  

```{.md}
@smith04 says blah

@smith04 [p. 33] says blah
```

# Making Changes

You can always manually add a reference or a few into the `bib` file, add a different file, or generate a new file and update the current one. The only requirement is that the identifiers for items remain constant, and if you are using the same software as last time for generating a `bib` file, there will be no differences in 99% of the cases. You will need to re-compile the output files to see the effects. 

You can use the same `bib` file with multiple documents (as long as you specify the path to it correctly in each of them). 

