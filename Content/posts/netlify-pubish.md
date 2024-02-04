---
date: 2024-02-03 22:10
description: Because Jekyll and GitHub Pages are too fiddly! 
tags: swift, hosting, publish
---

# Hosting a Swift Publish blog on Netlify

[GitHub Pages is excellent](https://pages.github.com/). You get free hosting of HTML-based websites, and you can extend that with [Jekyll](https://jekyllrb.com/), transforming markdown files into feature-rich and pleasing-looking pages. Using these together is the approach I took two years ago with my first attempt at blogging.

When I decided to try again, I gave up on the first steps. The ruby version on my Mac needed to be newer to use the Jekyll template I had previously used, and between Cocaopods and Appium, I haven't had a great time with Gems or Ruby.

That's when I remembered that John Sundell created Publish!

## What is Publish?

[Publish](https://github.com/JohnSundell/Publish)

> Welcome to Publish, a static site generator built specifically for Swift developers. It enables entire websites to be created using Swift and supports themes, plugins and many other powerful customization options.

I have worked exclusively in iOS for the last eight months and enjoy working with Swift (less so with Xcode). Using Swift to help generate web pages from markdown with Swift configuring the themes and functionality is a no-brainer.

### Getting Started with Publish

Please note that my git usage caused me to 💥 [the existing repo for my website](https://github.com/kelvinharron/kelvinharron.com) and replace it with a Publish project. I didn't care about the old blog posts, but I recommend backing up your existing blog if you are trying to do the same!

I followed the excellent tutorial by [Danijela Vrzan](https://www.danijelavrzan.com/posts/2022/06/create-portfolio-website-using-publish/) to get started and used the default Publish template to feel my way around the Swift code which defines a lot of base content in `main.swift`.

## Why did you move from GitHub Pages?

The 🥊 with this code block:
```
// This will generate your website using the built-in Foundation theme:
try KelvinHarron().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateSiteMap(),
    .generateHTML(withTheme: .foundation),
    .generateRSSFeed(including: [.posts]),
    .unwrap(.gitHub("kelvinharron/kelvinharron.com", branch: "master", useSSH: true), PublishingStep.deploy)
])
```

You see, running `publish deploy` uses the value set in the `.unwrap` function to push the contents of the `Output` directory, your actual website that should be hosted. I didn't understand the workflow here, and GitHub Pages did want to host it on my custom domain. After some Googling and [discovering that it won't work with the default theme](https://www.reddit.com/r/swift/comments/za11zu/comment/izjzl9q/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) meant I had the choice of making a custom theme or looking for an alternative means to host.

After reading [Kprow's blog](https://www.kprow.com/projects/swift-static-website-generator/), I settled on Netlify as a host.

## Configuring Netlify as a Host

The onboarding experience here is superb. Of course, it went wrong because I naively assumed I could ignore the `Output` directory where Publish places your generated website, but this failed.

Another issue I was surprised to solve easily was that Netlify, by default, installs Swift 5.4, but the latest version of Publish uses `// swift-tools-version:5.5`. To fix this on Netlify,
> Go to Your Website -> Site Configuration -> Environment variables -> add `SWIFT_VERSION` and set the value to `5.5`. Done!

If you went through the onboarding successfully, Netlify will build your main branch on change and publish it to a `netlify.app` domain. Almost there!

## Configure your custom domain to Netlify

If you want to use `yourname.com` instead of `yourname.netlify.app` or the like, you must purchase your domain. I used [NameSilo](https://www.namesilo.com/) to do this.

### Setting the A and CNAME DNS

To let Netlify host on `yourname.com` or equivalent, tell your domain host about Netlify. To do this for NameSilo, access the [Manage DNS page](https://www.namesilo.com/account_domain_manage_dns.php) and set the `A` type to the IP address Netlify gives in its setup, and `apex-loadbalancer.netlify.com` for the `CNAME` type for the www. part of your website. It can take 15+ minutes for the changes to propagate, and when done correctly, Netlify will acknowledge it under its Production domains. ✅

Now you're flying! While this is a high-level summary, I plan to record the flow end to end as an exercise and a good introduction for me on streaming. If you get stuck at any point, please get in touch via Twitter / X, and I'll be happy to help!
