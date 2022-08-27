/*
    jQuery News Ticker is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 2 of the License.
 
    jQuery News Ticker is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with jQuery News Ticker.  If not, see <http://www.gnu.org/licenses/>.
*/
!function(p){p.fn.ticker=function(e){var m=p.extend({},p.fn.ticker.defaults,e);if(0==p(this).length)return window.console&&window.console.log?window.console.log("Element does not exist in DOM!"):alert("Element does not exist in DOM!"),!1;var i="#"+p(this).attr("id"),s=p(this).get(0).tagName;return this.each(function(){var e=(new Date).getTime(),a={position:0,time:0,distance:0,newsArr:{},play:!0,paused:!1,contentLoaded:!1,dom:{contentID:"#ticker-content-"+e,titleID:"#ticker-title-"+e,titleElem:"#ticker-title-"+e+" SPAN",tickerID:"#ticker-"+e,wrapperID:"#ticker-wrapper-"+e,revealID:"#ticker-swipe-"+e,revealElem:"#ticker-swipe-"+e+" SPAN",controlsID:"#ticker-controls-"+e,prevID:"#prev-"+e,nextID:"#next-"+e,playPauseID:"#play-pause-"+e}};if("UL"!=s&&"OL"!=s&&!0===m.htmlFeed)return r("Cannot use <"+s.toLowerCase()+"> type of element for this plugin - must of type <ul> or <ol>"),!1;function l(e){var t,o=0;for(t in e)e.hasOwnProperty(t)&&o++;return o}function r(e){m.debugMode&&(window.console&&window.console.log?window.console.log(e):alert(e))}function c(){var e;a.contentLoaded=!0,p(a.dom.titleElem).html(a.newsArr["item-"+a.position].type),p(a.dom.contentID).html(a.newsArr["item-"+a.position].content),a.position==l(a.newsArr)-1?a.position=0:a.position++,distance=p(a.dom.contentID).width(),time=distance/m.speed,p(a.dom.contentID).css("opacity","1"),a.play&&(e=p(a.dom.titleID).width()+20,p(a.dom.revealID).css(m.direction,e+"px"),"fade"==m.displayType?p(a.dom.revealID).hide(0,function(){p(a.dom.contentID).css(m.direction,e+"px").fadeIn(m.fadeInSpeed,t)}):"scroll"==m.displayType||p(a.dom.revealElem).show(0,function(){p(a.dom.contentID).css(m.direction,e+"px").show(),animationAction="right"==m.direction?{marginRight:distance+"px"}:{marginLeft:distance+"px"},p(a.dom.revealID).css("margin-"+m.direction,"0px").delay(20).animate(animationAction,time,"linear",t)}))}function t(){a.play?(p(a.dom.contentID).delay(m.pauseOnItems).fadeOut(m.fadeOutSpeed),"fade"==m.displayType?p(a.dom.contentID).fadeOut(m.fadeOutSpeed,function(){p(a.dom.wrapperID).find(a.dom.revealElem+","+a.dom.contentID).hide().end().find(a.dom.tickerID+","+a.dom.revealID).show().end().find(a.dom.tickerID+","+a.dom.revealID).removeAttr("style"),c()}):p(a.dom.revealID).hide(0,function(){p(a.dom.contentID).fadeOut(m.fadeOutSpeed,function(){p(a.dom.wrapperID).find(a.dom.revealElem+","+a.dom.contentID).hide().end().find(a.dom.tickerID+","+a.dom.revealID).show().end().find(a.dom.tickerID+","+a.dom.revealID).removeAttr("style"),c()})})):p(a.dom.revealElem).hide()}function o(){a.play=!1,p(a.dom.tickerID+","+a.dom.revealID+","+a.dom.titleID+","+a.dom.titleElem+","+a.dom.revealElem+","+a.dom.contentID).stop(!0,!0),p(a.dom.revealID+","+a.dom.revealElem).hide(),p(a.dom.wrapperID).find(a.dom.titleID+","+a.dom.titleElem).show().end().find(a.dom.contentID).show()}function n(){a.play=!0,a.paused=!1,t()}function d(e){switch(o(),e){case"prev":0==a.position?a.position=l(a.newsArr)-2:1==a.position?a.position=l(a.newsArr)-1:a.position=a.position-2,p(a.dom.titleElem).html(a.newsArr["item-"+a.position].type),p(a.dom.contentID).html(a.newsArr["item-"+a.position].content);break;case"next":p(a.dom.titleElem).html(a.newsArr["item-"+a.position].type),p(a.dom.contentID).html(a.newsArr["item-"+a.position].content)}a.position==l(a.newsArr)-1?a.position=0:a.position++}"rtl"==m.direction?m.direction="right":m.direction="left",function(){if(0==a.contentLoaded)if(m.ajaxFeed)"xml"==m.feedType?p.ajax({url:m.feedUrl,cache:!1,dataType:m.feedType,async:!0,success:function(e){for(var t=count=0;t<e.childNodes.length;t++)"rss"==e.childNodes[t].nodeName&&(xmlContent=e.childNodes[t]);for(var o=0;o<xmlContent.childNodes.length;o++)"channel"==xmlContent.childNodes[o].nodeName&&(xmlChannel=xmlContent.childNodes[o]);for(var n=0;n<xmlChannel.childNodes.length;n++)if("item"==xmlChannel.childNodes[n].nodeName){xmlItems=xmlChannel.childNodes[n];for(var d,i=!1,s=0;s<xmlItems.childNodes.length;s++)"title"==xmlItems.childNodes[s].nodeName?d=xmlItems.childNodes[s].lastChild.nodeValue:"link"==xmlItems.childNodes[s].nodeName&&(i=xmlItems.childNodes[s].lastChild.nodeValue),!1!==d&&""!=d&&!1!==i&&(a.newsArr["item-"+count]={type:m.titleText,content:'<a href="'+i+'">'+d+"</a>"},count++,i=d=!1)}if(l(a.newsArr<1))return r("Couldn't find any content from the XML feed for the ticker to use!"),!1;a.contentLoaded=!0,c()}}):r("Code Me!");else{if(!m.htmlFeed)return r("The ticker is set to not use any types of content! Check the settings for the ticker.");{if(!(0<p(i+" LI").length))return r("Couldn't find HTML any content for the ticker to use!");p(i+" LI").each(function(e){a.newsArr["item-"+e]={type:m.titleText,content:p(this).html()}})}}}(),p(i).wrap('<div id="'+a.dom.wrapperID.replace("#","")+'"></div>'),p(a.dom.wrapperID).children().remove(),p(a.dom.wrapperID).append('<div id="'+a.dom.tickerID.replace("#","")+'" class="ticker"><div id="'+a.dom.titleID.replace("#","")+'" class="ticker-title"><span>\x3c!-- --\x3e</span></div><p id="'+a.dom.contentID.replace("#","")+'" class="ticker-content"></p><div id="'+a.dom.revealID.replace("#","")+'" class="ticker-swipe"><span>\x3c!-- --\x3e</span></div></div>'),p(a.dom.wrapperID).removeClass("no-js").addClass("ticker-wrapper has-js "+m.direction),p(a.dom.tickerElem+","+a.dom.contentID).hide(),m.controls&&(p(a.dom.controlsID).on("click mouseover mousedown mouseout mouseup",function(e){var t=e.target.id;if("click"==e.type)switch(t){case a.dom.prevID.replace("#",""):a.paused=!0,p(a.dom.playPauseID).addClass("paused"),d("prev");break;case a.dom.nextID.replace("#",""):a.paused=!0,p(a.dom.playPauseID).addClass("paused"),d("next");break;case a.dom.playPauseID.replace("#",""):1==a.play?(a.paused=!0,p(a.dom.playPauseID).addClass("paused"),o()):(a.paused=!1,p(a.dom.playPauseID).removeClass("paused"),n())}else"mouseover"==e.type&&p("#"+t).hasClass("controls")?p("#"+t).addClass("over"):"mousedown"==e.type&&p("#"+t).hasClass("controls")?p("#"+t).addClass("down"):"mouseup"==e.type&&p("#"+t).hasClass("controls")?p("#"+t).removeClass("down"):"mouseout"==e.type&&p("#"+t).hasClass("controls")&&p("#"+t).removeClass("over")}),p(a.dom.wrapperID).append('<ul id="'+a.dom.controlsID.replace("#","")+'" class="ticker-controls"><li id="'+a.dom.playPauseID.replace("#","")+'" class="jnt-play-pause controls"><a href="">\x3c!-- --\x3e</a></li><li id="'+a.dom.prevID.replace("#","")+'" class="jnt-prev controls"><a href="">\x3c!-- --\x3e</a></li><li id="'+a.dom.nextID.replace("#","")+'" class="jnt-next controls"><a href="">\x3c!-- --\x3e</a></li></ul>')),"fade"!=m.displayType&&p(a.dom.contentID).mouseover(function(){0==a.paused&&o()}).mouseout(function(){0==a.paused&&n()}),m.ajaxFeed||c()})},p.fn.ticker.defaults={speed:.1,ajaxFeed:!1,feedUrl:"",feedType:"xml",displayType:"reveal",htmlFeed:!0,debugMode:!0,controls:!0,titleText:"",direction:"ltr",pauseOnItems:3e3,fadeInSpeed:600,fadeOutSpeed:300}}(jQuery);