---
authors:
- admin
date: "2021-09-13"
projects: []
subtitle: ''
title: 'Authenticating with your Github Credentials in R'
summary: ""  
toc: true
menu:
  misc:
    weight: 2
type: posts
layout: docs
---

## Problem

In order to interact with GitHub via Rstudio, you need to authenticate yourself. That is, you need to prove you are the owner of your GitHub account. When you log in to GitHub from your browser, you provide your username and password to prove your identity. But when you want to push and pull from your computer, you will need to use a **personal access token (PAT)**.

This is how R may try to tell you that it wants to see your PAT:

<code class="language-bash hljs">
remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead. <br> remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information. <br>
fatal: unable to access "uni-mannheim-qm-2021/week01..." : The requested URL returned error: 403
</code>

<br>

## How to Fix It? 

## Step 1: Get a PAT

Run these lines in the *console* (left bottom pane):

```r
install.packages("usethis")
usethis::create_github_token()
```


This will open a new page on Github in your browser, where you'll need to select the validity period of your PAT - **Expiration** - (I usually do 90 days), and click on **Generate Token** at the bottom of the page.

Next page will give you the PAT. It will be a long string and will look something like this: `ghp_Kt33T3rXI1m4a9vxpBU0ngRU0`. Don't close this page yet! You'll need this token, so copy it. 

## Step 2: Save (a.k.a. cache) it in R


Now that you have the PAT, you need to tell it to R. Up until now, it's only there on Github and R does not know your PAT. Here's how you tell the PAT to R:

```r
install.packages("credentials")
library(credentials)
set_github_pat()
```


Respond to the prompt with your personal access token (PAT). 

If successful, your initial (and subsequent) calls will look like this:

```r
set_github_pat()

# If prompted for GitHub credentials, enter your PAT in the password field
# Using GITHUB_PAT from Viktoriia Semenova (credential helper: manager-core)
```


<br>

That's it. You should be able to get your Github repo onto your local Rstudio now!






