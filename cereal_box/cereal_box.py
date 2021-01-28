#!/usr/bin/env python3

import os
import sys
import cairo

s = cairo.SVGSurface("cereal.svg", 400, 400)
c = cairo.Context(s)
c.save()
c.set_line_width(1)
c.move_to(10, 10)
c.line_to(100, 100)
c.stroke()
c.restore()
c.show_page()
s.finish()


