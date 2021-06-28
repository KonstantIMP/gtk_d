module gio.CharsetConverter;

private import gio.ConverterIF;
private import gio.ConverterT;
private import gio.InitableIF;
private import gio.InitableT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * #GCharsetConverter is an implementation of #GConverter based on
 * GIConv.
 */
public class CharsetConverter : ObjectG, ConverterIF, InitableIF
{
	/** the main Gtk struct */
	protected GCharsetConverter* gCharsetConverter;

	/** Get the main Gtk struct */
	public GCharsetConverter* getCharsetConverterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gCharsetConverter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gCharsetConverter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GCharsetConverter* gCharsetConverter, bool ownedRef = false)
	{
		this.gCharsetConverter = gCharsetConverter;
		super(cast(GObject*)gCharsetConverter, ownedRef);
	}

	// add the Converter capabilities
	mixin ConverterT!(GCharsetConverter);

	// add the Initable capabilities
	mixin InitableT!(GCharsetConverter);


	/** */
	public static GType getType()
	{
		return g_charset_converter_get_type();
	}

	/**
	 * Creates a new #GCharsetConverter.
	 *
	 * Params:
	 *     toCharset = destination charset
	 *     fromCharset = source charset
	 *
	 * Returns: a new #GCharsetConverter or %NULL on error.
	 *
	 * Since: 2.24
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string toCharset, string fromCharset)
	{
		GError* err = null;

		auto __p = g_charset_converter_new(Str.toStringz(toCharset), Str.toStringz(fromCharset), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GCharsetConverter*) __p, true);
	}

	/**
	 * Gets the number of fallbacks that @converter has applied so far.
	 *
	 * Returns: the number of fallbacks that @converter has applied
	 *
	 * Since: 2.24
	 */
	public uint getNumFallbacks()
	{
		return g_charset_converter_get_num_fallbacks(gCharsetConverter);
	}

	/**
	 * Gets the #GCharsetConverter:use-fallback property.
	 *
	 * Returns: %TRUE if fallbacks are used by @converter
	 *
	 * Since: 2.24
	 */
	public bool getUseFallback()
	{
		return g_charset_converter_get_use_fallback(gCharsetConverter) != 0;
	}

	/**
	 * Sets the #GCharsetConverter:use-fallback property.
	 *
	 * Params:
	 *     useFallback = %TRUE to use fallbacks
	 *
	 * Since: 2.24
	 */
	public void setUseFallback(bool useFallback)
	{
		g_charset_converter_set_use_fallback(gCharsetConverter, useFallback);
	}
}
