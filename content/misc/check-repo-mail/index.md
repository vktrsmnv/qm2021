---
authors:
- admin
date: "2021-09-17"
draft: false
featured: false
projects: []
subtitle: ''
title: 'Check Repo: Run failed'
summary: ""  
menu:
  misc:
    weight: 2
toc: true
---


So you pushed your files into Github and everything was fine. And then you get an email saying *Check Repo: Run failed* (or something along these lines). 

> _This message is **not** an indicator that your push was unsuccessful_. 

## Problem

This mail is the result of an automated check that we set up for your homework files. It ensures that the files you upload are reproducible and self-contained, i.e., that your results can be replicated by anyone using only the material in your repository. This check ensures that we can generate a PDF from your `Rmd` file (or any other file type that is specified as `output` in the YAML (first part with your name, document title, etc.) of the `Rmd`). 

This usually is an indicator that everything is working in the code - data files are present, there are no typos in commands, etc. 

This message is not an error, your push still worked. It's an early feedback for you to make sure the file works properly.


## How to Fix It?

There could be various reasons for why the check failed and the error message there will usually tell you what the problem is:

## Step 1: Try to Knit on Your Laptop

Before pushing the files, try to *Knit* a file on your laptop. If you cannot get a PDF or HTML from your `Rmd`, here are a few common problems:

- You have a typo in the YAML (e.g., missing colon, open quotation marks, etc.)
- Some data file is missing/not loaded.
- There is a typo in the R command. Try running each chunk one after another to see where the issue is exactly. 
- Open parentheses somewhere. Try running each chunk one after another to see where the problem is exactly. 

## Step 2: Ensure Reproducibility 

What if you *could* get a PDF or HTML from your `Rmd` on your laptop but the check is nevertheless failed? This usually means that something that was on your local machine was missing on the remote one that attempted to generate the PDF/HTML. 

Check if you are using any packages but do not include a line to install them. In order to ensure complete reproducibility, all packages need to be installed with your `Rmd` file. List all the packages you used in the `setup` chunk of your `Rmd` (the very first chunk of code) into the vector `p_needed`:

```r
p_needed <- c("foreign", "viridis", "here", "styler")
```



 