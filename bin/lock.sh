# !/bin/sh
#
# lock screen and show hentai-esque censoring with maim
#

maim /tmp/lockpic.png
convert /tmp/lockpic.png -scale 10% -scale 1000% /tmp/lockpic.png

# TODO: put these in an order that makes sense
separator=88aaaaff
ringver=88aaaaff
insidever=88aaaaff
txt=ffffffff
inside=88aaaaff
insidewrong=c59799ff
ringwrong=c59799ff
keyhl=ffffffff
bsh=c59799ff
ring=88aaaaff

i3lock --separatorcolor=$separator \
		--ringvercolor=$ringver \
		--ringwrongcolor=$ringwrong \
		--insidecolor=$inside \
		--insidevercolor=$insidever \
		--insidewrongcolor=$insidewrong \
		--textcolor=$txt \
		--keyhlcolor=$keyhl \
		--bshlcolor=$bsh \
		--ringcolor=$ring \
		-r -i /tmp/lockpic.png

rm /tmp/lockpic.png
