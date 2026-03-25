# Extended OpenCart
This project is a heavily modified fork of ocStore 3.0.3.7 (internal VERSION remains 3.0.3.7 for compatibility)

## What the hell is this?
This is ocStore that I kept tweaking and customizing until it turned into something capable of powering not just another boring online store, but pretty much any business website that doesn’t desperately need React / Vue / Next.js slapped on top. The good old web dev days: you know precisely what your code is doing, minus the mysterious bundler sorcery and toolchain voodoo.

I ruthlessly removed everything that personally annoyed me.  
The result is a fairly flexible engine with clean and simple UI and a bunch of conveniences that stock OpenCart / ocStore never had - and most likely never will.

## Requirements
- PHP 7.2-7.4 (yes, still no 8.1+ - compatibility over hype, sorry)
- MySQL 5.7+
- Composer (come on, it’s 2026 already)

## Installation (short & painless version)
```bash
git clone https://github.com/ex-url/exopencart
```
> create a utf8mb4_unicode_ci database
> run the classic OpenCart installer
> pray it works on the first try (success rate ≈ 87%)

## How it differs from ocStore / vanilla OpenCart

- Completely rewritten frontend using Bulma instead of Bootstrap (yes, I’m one of those people who got tired of bootstrap-everything)
- Checkout process completely rebuilt - original OpenCart 3 / ocStore ordering flow was a bloated mess. Now it’s clean, logical and actually usable.
- Multi-store selector module now shows current store (or city) next to logo. Click > async-loaded modal with search. Cleaner page load, better for cross-domain SEO (per my SEO friend).
- Dedicated cookie consent module - because GDPR banners are apparently forever.
- Blog now works fine.
- Replies to reviews & comments - answer users directly under their feedback without extra extensions.
- Composer initialized in storage folder. Vanilla OpenCart lacks this - here it’s ready out of the box for easy dependency management.
- Separate checkout success template. Dedicated page instead of reusing common/success. Looks better and safe to customize without side effects.
- Built-in Bulma SCSS compiler - tweak variables > click once > get your custom theme, that's it.
- Live search in catalog (not perfect, but way better than the stock disaster)
- Dark theme out of the box + default theme setting + optional theme switcher (or hide it forever if you hate modern trends)
- Product options finally grew up: support for *, /, = (not just + and -), default value, option to hide option prices, link to any other product from each option value (seriously saves lives in complex configurators)
- Stickers for products & categories + mass assign / remove
- Reviews now support photos (people love this)
- Default sort order per category + option to push out-of-stock items to the end
- Model-level caching for products, attributes, options - toggle with one checkbox, plus cron-based cache warmup. Must-have on medium-sized shops.
- Image cache generation modes: default / crop / scale - configurable per entity type
- Mass discount management (by category, manufacturer, price range, name, etc.) + show discount percentage
- Units of measurement dictionary + support for fractional quantities (0.5 kg, 2.25 m, etc.)
- Rewritten HTML module: ditched the horrible visual editor for CodeMirror syntax highlighting + option to include Swiper & Fancybox right inside the module
- Basic PWA support: dynamic manifest, service worker, custom “add to home screen” prompt (can be fully disabled or just hide the prompt)
- Dead-simple custom fonts: drop font files into the folder - they auto-connect with preload and all the good stuff
- Yandex Captcha built-in (because sometimes reCAPTCHA just pisses you off)
- Icons + tooltips for attributes
- Much nicer-looking notifications
- 301 redirects for categories/products right from admin
- Duplicate any module instance with all its settings
- Easyly add contacts, messengers, social links in system settings
- Sitemap.xml generation - one-click or via cron
- The sitemap can now optionally include categories and/or blog articles.
- Optional .webp thumbnails + CSS/JS minification
- Built-in Telegram bot webhook support
- File search in the downloads section of admin (sounds tiny, feels huge when you need it)
- The maintenance mode page now looks nice
- Now in the settings you can specify the exact dimensions of the logo image.
- The settings now have an option to show similar products on the product page.
- Product-related articles are now displayed on the product page, whereas previously they were merely linked.
- Now in the settings you can specify whether to display the phone number and email in different places (header, footer, contacts), as well as whether to show the feedback form on the contacts page.
- A special section for incoming requests has been added, where you can add the username, email or phone number, message, dates of submission/processing by the manager, status, comment, sender's IP, submission page, and the login of the user who processed the request.

A bunch of small fixes and tweaks were also made — can't even remember them all. It's better to see once than hear a hundred times (or read about them).

## Modules compatibility

Real talk: 60–70% of OpenCart / ocStore extensions will probably install and work (especially pure admin/backend stuff).
Anything that touches twig / html / css / js on the frontend side - expect to do some fixing.
But if you can code even a little bit, almost everything can be made to work.

## Thanks
Huge shoutout to everyone who built OpenCart, ocStore, Bulma, jQuery and all the other open-source. Thank you guys!

## Wanna make it better together?

This is my pet project that’s already running in production on real stores.
If you want in - issues, PRs, code reviews, well-argued rage in DMs - all welcome.
Donations won’t be refused either, but they’re not the main goal.
Good luck with your projects, and just good luck in life in general - it never hurts.