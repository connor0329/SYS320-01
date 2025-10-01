$scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.19/ToBeScraped.html

#$scrapedpage.Links.Count

#$scrapedpage.Links

#$scrapedpage.Links | Select-Object outerText, href

#$h2s = $scrapedpage.ParsedHtml.body.getElementsByTagName("h2") | select outerText

#$h2s

$divs1 = $scrapedpage.ParsedHtml.body.getElementsByTagName("div") | where { ` 
$_.getAttributeNode("class").value -ilike "div-1" } | select innerText

$divs1