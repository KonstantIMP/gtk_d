module sourceview.StyleScheme;

private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import sourceview.Style;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class StyleScheme : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceStyleScheme* gtkSourceStyleScheme;

	/** Get the main Gtk struct */
	public GtkSourceStyleScheme* getStyleSchemeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceStyleScheme;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceStyleScheme;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceStyleScheme* gtkSourceStyleScheme, bool ownedRef = false)
	{
		this.gtkSourceStyleScheme = gtkSourceStyleScheme;
		super(cast(GObject*)gtkSourceStyleScheme, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_style_scheme_get_type();
	}

	/**
	 * Returns: a
	 *     %NULL-terminated array containing the @scheme authors or %NULL if
	 *     no author is specified by the style scheme.
	 *
	 * Since: 2.0
	 */
	public string[] getAuthors()
	{
		return Str.toStringArray(gtk_source_style_scheme_get_authors(gtkSourceStyleScheme));
	}

	/**
	 * Returns: @scheme description (if defined), or %NULL.
	 *
	 * Since: 2.0
	 */
	public string getDescription()
	{
		return Str.toString(gtk_source_style_scheme_get_description(gtkSourceStyleScheme));
	}

	/**
	 * Returns: @scheme file name if the scheme was created
	 *     parsing a style scheme file or %NULL in the other cases.
	 *
	 * Since: 2.0
	 */
	public string getFilename()
	{
		return Str.toString(gtk_source_style_scheme_get_filename(gtkSourceStyleScheme));
	}

	/**
	 * Returns: @scheme id.
	 *
	 * Since: 2.0
	 */
	public string getId()
	{
		return Str.toString(gtk_source_style_scheme_get_id(gtkSourceStyleScheme));
	}

	/**
	 * Returns: @scheme name.
	 *
	 * Since: 2.0
	 */
	public string getName()
	{
		return Str.toString(gtk_source_style_scheme_get_name(gtkSourceStyleScheme));
	}

	/**
	 *
	 * Params:
	 *     styleId = id of the style to retrieve.
	 * Returns: style which corresponds to @style_id in
	 *     the @scheme, or %NULL when no style with this name found.  It is owned by
	 *     @scheme and may not be unref'ed.
	 *
	 * Since: 2.0
	 */
	public Style getStyle(string styleId)
	{
		auto __p = gtk_source_style_scheme_get_style(gtkSourceStyleScheme, Str.toStringz(styleId));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Style)(cast(GtkSourceStyle*) __p);
	}
}
