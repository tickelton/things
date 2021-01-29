#!/usr/bin/env python3

import os
import sys
import cairo


OUTLINE_TOP_IN_MM = (
    (0, 40),
    (12, 26),
    (14, 8),
    (25, 8),
    (25, 0),
    (67, 0),
    (67, 8),
    (78, 8),
    (79, 25),
    (81, 27),
    (81, 13),
    (87, 8),
    (116, 8),
    (121, 13),
    (121, 27),
    (123, 25),
    (125, 0),
    (188, 0),
    (190, 25),
    (192, 27),
    (192, 13),
    (198, 8),
    (227, 8),
    (233, 13),
    (233, 26),
    (232, 28),
)


POINTS_PER_MM = 2.8346456693
width_in_mm = 233
height_in_mm = 157
width_in_points =  width_in_mm * POINTS_PER_MM
height_in_points = height_in_mm * POINTS_PER_MM

def mm_to_pt(mm):
    return mm * POINTS_PER_MM

def draw_shape_mm(c, shape, invert_y=False, height=0):
    start = True
    for p in shape:
        y = p[1]
        if invert_y:
            y = height - p[1]
        if start:
            #print("c.move_to(mm_to_pt(",p[0],"), mm_to_pt(",y,"))")
            c.move_to(mm_to_pt(p[0]), mm_to_pt(y))
            start = False
        else:
            #print("c.line_to(mm_to_pt(",p[0],"), mm_to_pt(",y,"))")
            c.line_to(mm_to_pt(p[0]), mm_to_pt(y))

s = cairo.SVGSurface("cereal.svg", width_in_points, height_in_points)
c = cairo.Context(s)
c.save()
c.set_line_width(1)

# draw top
draw_shape_mm(c, OUTLINE_TOP_IN_MM)
# draw bottom, i.e. top with inverted y coordinates
draw_shape_mm(c, OUTLINE_TOP_IN_MM, invert_y=True, height=height_in_mm)
# close sides
c.move_to(
    mm_to_pt(OUTLINE_TOP_IN_MM[0][0]),
    mm_to_pt(OUTLINE_TOP_IN_MM[0][1]),
)
c.line_to(
    mm_to_pt(OUTLINE_TOP_IN_MM[0][0]),
    mm_to_pt(height_in_mm - OUTLINE_TOP_IN_MM[0][1]),
)
c.move_to(
    mm_to_pt(OUTLINE_TOP_IN_MM[len(OUTLINE_TOP_IN_MM)-1][0]),
    mm_to_pt(OUTLINE_TOP_IN_MM[len(OUTLINE_TOP_IN_MM)-1][1]),
)
c.line_to(
    mm_to_pt(OUTLINE_TOP_IN_MM[len(OUTLINE_TOP_IN_MM)-1][0]),
    mm_to_pt(height_in_mm - OUTLINE_TOP_IN_MM[len(OUTLINE_TOP_IN_MM)-1][1]),
)

c.stroke()
c.restore()
c.show_page()
s.finish()


