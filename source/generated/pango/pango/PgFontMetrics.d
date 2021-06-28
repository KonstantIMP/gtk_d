module pango.PgFontMetrics;

private import gobject.ObjectG;
private import linker.loader;
private import pango.c.functions;
public  import pango.c.types;


/**
 * A `PangoFontMetrics` structure holds the overall metric information
 * for a font.
 * 
 * The information in a `PangoFontMetrics` structure may be restricted
 * to a script. The fields of this structure are private to implementations
 * of a font backend. See the documentation of the corresponding getters
 * for documentation of their meaning.
 */
public class PgFontMetrics
{
	/** the main Gtk struct */
	protected PangoFontMetrics* pangoFontMetrics;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public PangoFontMetrics* getPgFontMetricsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoFontMetrics;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)pangoFontMetrics;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoFontMetrics* pangoFontMetrics, bool ownedRef = false)
	{
		this.pangoFontMetrics = pangoFontMetrics;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_PANGO[0]) && ownedRef )
			pango_font_metrics_unref(pangoFontMetrics);
	}


	/** */
	public static GType getType()
	{
		return pango_font_metrics_get_type();
	}

	/**
	 * Gets the approximate character width for a font metrics structure.
	 *
	 * This is merely a representative value useful, for example, for
	 * determining the initial size for a window. Actual characters in
	 * text will be wider and narrower than this.
	 *
	 * Returns: the character width, in Pango units.
	 */
	public int getApproximateCharWidth()
	{
		return pango_font_metrics_get_approximate_char_width(pangoFontMetrics);
	}

	/**
	 * Gets the approximate digit width for a font metrics structure.
	 *
	 * This is merely a representative value useful, for example, for
	 * determining the initial size for a window. Actual digits in
	 * text can be wider or narrower than this, though this value
	 * is generally somewhat more accurate than the result of
	 * pango_font_metrics_get_approximate_char_width() for digits.
	 *
	 * Returns: the digit width, in Pango units.
	 */
	public int getApproximateDigitWidth()
	{
		return pango_font_metrics_get_approximate_digit_width(pangoFontMetrics);
	}

	/**
	 * Gets the ascent from a font metrics structure.
	 *
	 * The ascent is the distance from the baseline to the logical top
	 * of a line of text. (The logical top may be above or below the top
	 * of the actual drawn ink. It is necessary to lay out the text to
	 * figure where the ink will be.)
	 *
	 * Returns: the ascent, in Pango units.
	 */
	public int getAscent()
	{
		return pango_font_metrics_get_ascent(pangoFontMetrics);
	}

	/**
	 * Gets the descent from a font metrics structure.
	 *
	 * The descent is the distance from the baseline to the logical bottom
	 * of a line of text. (The logical bottom may be above or below the
	 * bottom of the actual drawn ink. It is necessary to lay out the text
	 * to figure where the ink will be.)
	 *
	 * Returns: the descent, in Pango units.
	 */
	public int getDescent()
	{
		return pango_font_metrics_get_descent(pangoFontMetrics);
	}

	/**
	 * Gets the line height from a font metrics structure.
	 *
	 * The line height is the distance between successive baselines
	 * in wrapped text.
	 *
	 * If the line height is not available, 0 is returned.
	 *
	 * Returns: the height, in Pango units
	 *
	 * Since: 1.44
	 */
	public int getHeight()
	{
		return pango_font_metrics_get_height(pangoFontMetrics);
	}

	/**
	 * Gets the suggested position to draw the strikethrough.
	 *
	 * The value returned is the distance *above* the
	 * baseline of the top of the strikethrough.
	 *
	 * Returns: the suggested strikethrough position, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getStrikethroughPosition()
	{
		return pango_font_metrics_get_strikethrough_position(pangoFontMetrics);
	}

	/**
	 * Gets the suggested thickness to draw for the strikethrough.
	 *
	 * Returns: the suggested strikethrough thickness, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getStrikethroughThickness()
	{
		return pango_font_metrics_get_strikethrough_thickness(pangoFontMetrics);
	}

	/**
	 * Gets the suggested position to draw the underline.
	 *
	 * The value returned is the distance *above* the baseline of the top
	 * of the underline. Since most fonts have underline positions beneath
	 * the baseline, this value is typically negative.
	 *
	 * Returns: the suggested underline position, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getUnderlinePosition()
	{
		return pango_font_metrics_get_underline_position(pangoFontMetrics);
	}

	/**
	 * Gets the suggested thickness to draw for the underline.
	 *
	 * Returns: the suggested underline thickness, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getUnderlineThickness()
	{
		return pango_font_metrics_get_underline_thickness(pangoFontMetrics);
	}

	alias doref = ref_;
	/**
	 * Increase the reference count of a font metrics structure by one.
	 *
	 * Returns: @metrics
	 */
	public PgFontMetrics ref_()
	{
		auto __p = pango_font_metrics_ref(pangoFontMetrics);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontMetrics)(cast(PangoFontMetrics*) __p, true);
	}

	/**
	 * Decrease the reference count of a font metrics structure by one.
	 * If the result is zero, frees the structure and any associated memory.
	 */
	public void unref()
	{
		pango_font_metrics_unref(pangoFontMetrics);
	}
}
