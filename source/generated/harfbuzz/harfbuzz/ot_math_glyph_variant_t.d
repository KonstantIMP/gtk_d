module harfbuzz.ot_math_glyph_variant_t;

private import glib.MemorySlice;
private import harfbuzz.c.functions;
public  import harfbuzz.c.types;
private import linker.loader;


/**
 * Data type to hold math-variant information for a glyph.
 *
 * Since: 1.3.3
 */
public final class ot_math_glyph_variant_t
{
	/** the main Gtk struct */
	protected hb_ot_math_glyph_variant_t* hb_ot_math_glyph_variant;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public hb_ot_math_glyph_variant_t* getot_math_glyph_variant_tStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hb_ot_math_glyph_variant;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)hb_ot_math_glyph_variant;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (hb_ot_math_glyph_variant_t* hb_ot_math_glyph_variant, bool ownedRef = false)
	{
		this.hb_ot_math_glyph_variant = hb_ot_math_glyph_variant;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_HARFBUZZ[0]) && ownedRef )
			sliceFree(hb_ot_math_glyph_variant);
	}


	/**
	 * The glyph index of the variant
	 */
	public @property hb_codepoint_t glyph()
	{
		return hb_ot_math_glyph_variant.glyph;
	}

	/** Ditto */
	public @property void glyph(hb_codepoint_t value)
	{
		hb_ot_math_glyph_variant.glyph = value;
	}

	/**
	 * The advance width of the variant
	 */
	public @property hb_position_t advance()
	{
		return hb_ot_math_glyph_variant.advance;
	}

	/** Ditto */
	public @property void advance(hb_position_t value)
	{
		hb_ot_math_glyph_variant.advance = value;
	}

	/** */
	public static GType getType()
	{
		return hb_gobject_ot_math_glyph_variant_get_type();
	}
}
