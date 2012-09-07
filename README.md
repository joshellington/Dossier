# Dossier, a link sharing application

An attempt at creating an easy to use link sharing application.

Includes (in-progress) email newsletter updates with customizable frequency. Bookmarklet for adding new links, voting, click counts, comments (powered by Disqus) and best of all, no user accounts.

## Bookmarklet

Because bookmarklets are awesome and easy as pie (borrowed structure from [Pinboard](https://pinboard.in/)):

`javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('http://doss.herokuapp.com/links/new?url='+encodeURIComponent(q)+'&title='+encodeURIComponent(p),'Dossier','toolbar=no,scrollbars=yes,width=450,height=700'));`

## TODO

- Implement cron jobs for sending out newsletters with Postmark
- Figure out authentication requirements
- Disable unlimited user voting (cookies should be fine)
- Tweak interface more (themes?)
- Data validation
- Better search
- More categories, multiple category support (option elements)
- Category views
- Analytics
- Finish this README