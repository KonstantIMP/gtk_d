module pango.PgFontsetSimple;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import pango.PgFont;
private import pango.PgFontset;
private import pango.PgLanguage;
private import pango.c.functions;
public  import pango.c.types;


/**
 * `PangoFontsetSimple` is a implementation of the abstract
 * `PangoFontset` base class as an array of fonts.
 * 
 * When creating a `PangoFontsetSimple`, you have to provide
 * the array of fonts that make up the fontset.
 */
public class PgFontsetSimple : PgFontset
{
	/** the main Gtk struct */
	protected PangoFontsetSimple* pangoFontsetSimple;

	/** Get the main Gtk struct */
	public PangoFontsetSimple* getPgFontsetSimpleStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoFontsetSimple;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoFontsetSimple;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoFontsetSimple* pangoFontsetSimple, bool ownedRef = false)
	{
		this.pangoFontsetSimple = pangoFontsetSimple;
		super(cast(PangoFontset*)pangoFontsetSimple, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return pango_fontset_simple_get_type();
	}

	/**
	 * Creates a new `PangoFontsetSimple` for the given language.
	 *
	 * Params:
	 *     language = a `PangoLanguage` tag
	 *
	 * Returns: the newly allocated `PangoFontsetSimple`, which should
	 *     be freed with g_object_unref().
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PgLanguage language)
	{
		auto __p = pango_fontset_simple_new((language is null) ? null : language.getPgLanguageStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(PangoFontsetSimple*) __p, true);
	}

	/**
	 * Adds a font to the fontset.
	 *
	 * Params:
	 *     font = a `PangoFont`.
	 */
	public void append(PgFont font)
	{
		pango_fontset_simple_append(pangoFontsetSimple, (font is null) ? null : font.getPgFontStruct());
	}

	/**
	 * Returns the number of fonts in the fontset.
	 *
	 * Returns: the size of @fontset.
	 */
	public int size()
	{
		return pango_fontset_simple_size(pangoFontsetSimple);
	}
}
