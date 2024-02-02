---
date: 2024-02-02 22:13
description: First post! + NameSilo & GitHub domain setup
tags: github, namesilo, blog, setup
---

# My First post! Something I stumbled a little with getting this blog together.

## Setting your apex domain with GitHub Pages & NameSilo

If you're considering using GitHub pages and want to provide an Apex domain (kelvinharron.com instead of kelvinharron.github.io), you may stumble a little bit if this is something you haven't done before. I'll go through how I enabled HTTPS with my domain purchased from NameSilo.

The very first thing is to purchase the domain you would like to use. GoDaddy is a domain provider we've all heard of but reading around a little, NameSilo came up a favourite for many as a simple, cheap and no-hassle solution. It defiantly doesn't have as much style but functionally, it will do the job. The next thing was to configure my apex domain with GitHub Pages for this very blog, but the below was giving errorsa around resolving the DNS.

<p align="left">
    <img src="/posts/first-post/1.png" alt="GitHub HTTPS enabled" width="1000" />
</p>

I found [an old post](https://chenhuijing.com/blog/setting-up-custom-domain-github-pages/#%F0%9F%87%B2%F0%9F%87%BE) on how to pair NameSilo with GitHub Pages exactly as I needed but figured going as far as Cloudflare was excessive, so with a little fiddling I was able to avoid that approach and just use my domain provider. In NameSilo's domaim manager for your website, they provide multiple templates to get you started. I just entered the appropriate A and AAAA values as detailed [here](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain) as GitHub can take care of creating a CNAME file for you. You can see how it looks below:

<p align="left">
    <img src="/posts/first-post/2.png" alt="Name Silo Setup" width="1000" />
</p>


It can take over 24 hours for these values to propagate, but you should be able to apply your apex domain name and enable HTTPS, so folks who find your website will not get any security warnings from their browsers.

With that, you'll have your own static blog hosted by GitHub with an apex domain of your choosing.

## Why not Medium?

Medium is a popular platform for blogging, and Android especially benefits from the folks at [Proandroiddev](https://proandroiddev.com/) collating a wealth of superb content across Medium. Creating an account allows you to follow your favourite authors and topics to get notified the moment new content is available, plus suggestions for what you might like! If you just want to start writing, definitely give Medium a go!

Being just a bit awkward, I chose to host my blog for a few reasons:

### Am I allowed to read your article?

Some people just don't like Medium as it's not always clear if an article is free to read. If you are researching a topic such as a new framework in Android and you're searching around for a few educated opinions on the matter, you can't guarantee seamless access.

### Keep It Simple Silly

A simple website with very limited functionality and content means you can serve focused content quickly as a static site. Something like Medium is more dynamic with its additional functionality, but a plain blog with markdown code blocks and embedded images keeps it fast and distraction-free.

### Learning experience

The last time I had a website was back in 2010, my needs were very different and the web was a vastly different place. Check this out! 😊

<p align="left">
    <img src="/posts/first-post/3.jpg" alt="Old Website" />
</p>

I do not remember how I set it up as part of my media course at the time. By choosing to create my blog, I could learn something new as my time as a mobile dev hasn't exposed me to anything like this.

## I want a GitHub Pages blog, where do I start?

[GitHub Pages](https://pages.github.com/) allows you to host a website for free, with the standard GitHub free account exposing the source publicly. If that doesn't bother you, you can follow this great [quick start guide](https://docs.github.com/en/pages/quickstart).

I'd like to thank [Jorge Sanz](https://github.com/jsanz) for his excellent starter kit for the GitHub Pages [minima starter kit](https://github.com/jsanz/gh-pages-minima-starter). I originally used the very default values that Jekyll sets with Minima but found I would break the blog when hosted after trying to use a dark mode variant. Something to revisit in the future...
