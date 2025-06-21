// this script requires jQuery
$(document).ready(function() {
    Footnotes.setup();
});

var Footnotes = {
    footnotetimeout: false,
    setup: function() {
        var footnotelinks = $("a[rel='footnote']")

        footnotelinks.unbind('mouseover',Footnotes.footnoteover);
        footnotelinks.unbind('mouseout',Footnotes.footnoteoout);

        footnotelinks.bind('mouseover',Footnotes.footnoteover);
        footnotelinks.bind('mouseout',Footnotes.footnoteoout);
    },
    footnoteover: function() {
        clearTimeout(Footnotes.footnotetimeout);
        $('#footnotediv').stop();
        $('#footnotediv').remove();

        var id = $(this).attr('href').substr(1);
        var position = $(this).offset();

        var div = $(document.createElement('div'));
        div.attr('id','footnotediv');
        div.bind('mouseover',Footnotes.divover);
        div.bind('mouseout',Footnotes.footnoteoout);

        var el = document.getElementById(id);
        div.html($(el).html());
        div.find("a[rev='footnote']").remove();

        div.css({
            position:'absolute',
            width:'20em',
            'max-width': '300px',
            background:'#F7F6EE',
            border:'solid 1px',
            'font-size':'90%',
            'font-family': "Equity Text A",
            'line-height':1.4,
            '-moz-border-radius':'.5em',
            '-webkit-border-radius':'.5em',
            'border-radius':'.5em',
            opacity: 1,
            'z-index': 9999
        });
        $(document.body).append(div);

        var left = position.left;
        if(left + div.outerWidth() > $(window).width() + $(window).scrollLeft())
            left = $(window).width() - div.outerWidth() + $(window).scrollLeft();
        var top = position.top+20;
        if(top + div.height() > $(window).height() + $(window).scrollTop())
            top = position.top - div.height() - 15;
        div.css({
            left:left,
            top:top
        });
    },
    footnoteoout: function() {
        Footnotes.footnotetimeout = setTimeout(function() {
            $('#footnotediv').remove();
        },100);
    },
    divover: function() {
        clearTimeout(Footnotes.footnotetimeout);
        $('#footnotediv').stop();
    }
} 