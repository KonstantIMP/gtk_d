module pango.PgColor;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import linker.loader;
private import pango.c.functions;
public  import pango.c.types;


/**
 * The `PangoColor` structure is used to
 * represent a color in an uncalibrated RGB color-space.
 */
public final class PgColor
{
	/** the main Gtk struct */
	protected PangoColor* pangoColor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public PangoColor* getPgColorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoColor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)pangoColor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoColor* pangoColor, bool ownedRef = false)
	{
		this.pangoColor = pangoColor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_PANGO[0]) && ownedRef )
			pango_color_free(pangoColor);
	}


	/**
	 * value of red component
	 */
	public @property ushort red()
	{
		return pangoColor.red;
	}

	/** Ditto */
	public @property void red(ushort value)
	{
		pangoColor.red = value;
	}

	/**
	 * value of green component
	 */
	public @property ushort green()
	{
		return pangoColor.green;
	}

	/** Ditto */
	public @property void green(ushort value)
	{
		pangoColor.green = value;
	}

	/**
	 * value of blue component
	 */
	public @property ushort blue()
	{
		return pangoColor.blue;
	}

	/** Ditto */
	public @property void blue(ushort value)
	{
		pangoColor.blue = value;
	}

	/** */
	public static GType getType()
	{
		return pango_color_get_type();
	}

	/**
	 * Creates a copy of @src.
	 *
	 * The copy should be freed with pango_color_free(). Primarily
	 * used by language bindings, not that useful otherwise (since
	 * colors can just be copied by assignment in C).
	 *
	 * Returns: the newly allocated `PangoColor`, which
	 *     should be freed with [method@Pango.Color.free], or %NULL if
	 *     @src was %NULL.
	 */
	public PgColor copy()
	{
		auto __p = pango_color_copy(pangoColor);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgColor)(cast(PangoColor*) __p, true);
	}

	/**
	 * Frees a color allocated by pango_color_copy().
	 */
	public void free()
	{
		pango_color_free(pangoColor);
		ownedRef = false;
	}

	/**
	 * Fill in the fields of a color from a string specification.
	 *
	 * The string can either
	 * one of a large set of standard names. (Taken from the CSS Color
	 * [specification](https://www.w3.org/TR/css-color-4/#named-colors), or it can be
	 * a value in the form `#rgb`, `#rrggbb`, `#rrrgggbbb` or `#rrrrggggbbbb`, where
	 * `r`, `g` and `b` are hex digits of the red, green, and blue components of the
	 * color, respectively. (White in the four forms is `#fff`, `#ffffff`, `#fffffffff`
	 * and `#ffffffffffff`.)
	 *
	 * Params:
	 *     spec = a string specifying the new color
	 *
	 * Returns: %TRUE if parsing of the specifier succeeded, otherwise false.
	 */
	public bool parse(string spec)
	{
		return pango_color_parse(pangoColor, Str.toStringz(spec)) != 0;
	}

	/**
	 * Fill in the fields of a color from a string specification.
	 *
	 * The string can
	 * either one of a large set of standard names. (Taken from the CSS Color
	 * [specification](https://www.w3.org/TR/css-color-4/#named-colors),
	 * or it can be a hexadecimal value in the form `#rgb`, `#rrggbb`, `#rrrgggbbb`
	 * or `#rrrrggggbbbb` where `r`, `g` and `b` are hex digits of the red, green,
	 * and blue components of the color, respectively. (White in the four
	 * forms is `#fff`, `#ffffff`, `#fffffffff` and `#ffffffffffff`.)
	 *
	 * Additionally, parse strings of the form `#rgba`, `#rrggbbaa`,
	 * `#rrrrggggbbbbaaaa`, if @alpha is not %NULL, and set @alpha to the value
	 * specified by the hex digits for `a`. If no alpha component is found
	 * in @spec, @alpha is set to 0xffff (for a solid color).
	 *
	 * Params:
	 *     alpha = return location for alpha, or %NULL
	 *     spec = a string specifying the new color
	 *
	 * Returns: %TRUE if parsing of the specifier succeeded, otherwise false.
	 *
	 * Since: 1.46
	 */
	public bool parseWithAlpha(out ushort alpha, string spec)
	{
		return pango_color_parse_with_alpha(pangoColor, &alpha, Str.toStringz(spec)) != 0;
	}

	/**
	 * Returns a textual specification of @color.
	 *
	 * The string is in the hexadecimal form `#rrrrggggbbbb`, where
	 * `r`, `g` and `b` are hex digits representing the red, green,
	 * and blue components respectively.
	 *
	 * Returns: a newly-allocated text string that must be freed with g_free().
	 *
	 * Since: 1.16
	 */
	public override string toString()
	{
		auto retStr = pango_color_to_string(pangoColor);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
