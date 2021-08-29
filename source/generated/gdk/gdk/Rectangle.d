module gdk.Rectangle;

private import gdk.c.functions;
public  import gdk.c.types;


/**
 * A `GdkRectangle` data type for representing rectangles.
 * 
 * `GdkRectangle` is identical to `cairo_rectangle_t`. Together with Cairo’s
 * `cairo_region_t` data type, these are the central types for representing
 * sets of pixels.
 * 
 * The intersection of two rectangles can be computed with
 * [method@Gdk.Rectangle.intersect]; to find the union of two rectangles use
 * [method@Gdk.Rectangle.union].
 * 
 * The `cairo_region_t` type provided by Cairo is usually used for managing
 * non-rectangular clipping of graphical operations.
 * 
 * The Graphene library has a number of other data types for regions and
 * volumes in 2D and 3D.
 */

/** */
public GType gdkRectangleGetType()
{
	return gdk_rectangle_get_type();
}

/**
 * Returns %TRUE if @rect contains the point described by @x and @y.
 *
 * Params:
 *     x = X coordinate
 *     y = Y coordinate
 *
 * Returns: %TRUE if @rect contains the point
 */
public bool containsPoint(GdkRectangle* rect, int x, int y)
{
	return gdk_rectangle_contains_point(rect, x, y) != 0;
}

/**
 * Checks if the two given rectangles are equal.
 *
 * Params:
 *     rect2 = a `GdkRectangle`
 *
 * Returns: %TRUE if the rectangles are equal.
 */
public bool equal(GdkRectangle* rect1, GdkRectangle* rect2)
{
	return gdk_rectangle_equal(rect1, rect2) != 0;
}

/**
 * Calculates the intersection of two rectangles.
 *
 * It is allowed for @dest to be the same as either @src1 or @src2.
 * If the rectangles do not intersect, @dest’s width and height is set
 * to 0 and its x and y values are undefined. If you are only interested
 * in whether the rectangles intersect, but not in the intersecting area
 * itself, pass %NULL for @dest.
 *
 * Params:
 *     src2 = a `GdkRectangle`
 *     dest = return location for the
 *         intersection of @src1 and @src2
 *
 * Returns: %TRUE if the rectangles intersect.
 */
public bool intersect(GdkRectangle* src1, GdkRectangle* src2, out GdkRectangle dest)
{
	return gdk_rectangle_intersect(src1, src2, &dest) != 0;
}

alias unio = union_;
/**
 * Calculates the union of two rectangles.
 *
 * The union of rectangles @src1 and @src2 is the smallest rectangle which
 * includes both @src1 and @src2 within it. It is allowed for @dest to be
 * the same as either @src1 or @src2.
 *
 * Note that this function does not ignore 'empty' rectangles (ie. with
 * zero width or height).
 *
 * Params:
 *     src2 = a `GdkRectangle`
 *     dest = return location for the union of @src1 and @src2
 */
public void union_(GdkRectangle* src1, GdkRectangle* src2, out GdkRectangle dest)
{
	gdk_rectangle_union(src1, src2, &dest);
}
