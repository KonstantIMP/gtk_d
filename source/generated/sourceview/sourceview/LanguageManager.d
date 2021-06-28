module sourceview.LanguageManager;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import sourceview.Language;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class LanguageManager : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceLanguageManager* gtkSourceLanguageManager;

	/** Get the main Gtk struct */
	public GtkSourceLanguageManager* getLanguageManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceLanguageManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceLanguageManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceLanguageManager* gtkSourceLanguageManager, bool ownedRef = false)
	{
		this.gtkSourceLanguageManager = gtkSourceLanguageManager;
		super(cast(GObject*)gtkSourceLanguageManager, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_language_manager_get_type();
	}

	/**
	 * Creates a new language manager. If you do not need more than one language
	 * manager or a private language manager instance then use
	 * gtk_source_language_manager_get_default() instead.
	 *
	 * Returns: a new #GtkSourceLanguageManager.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_language_manager_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceLanguageManager*) __p, true);
	}

	/**
	 * Returns the default #GtkSourceLanguageManager instance.
	 *
	 * Returns: a #GtkSourceLanguageManager.
	 *     Return value is owned by GtkSourceView library and must not be unref'ed.
	 */
	public static LanguageManager getDefault()
	{
		auto __p = gtk_source_language_manager_get_default();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(LanguageManager)(cast(GtkSourceLanguageManager*) __p);
	}

	/**
	 * Gets the #GtkSourceLanguage identified by the given @id in the language
	 * manager.
	 *
	 * Params:
	 *     id = a language id.
	 *
	 * Returns: a #GtkSourceLanguage, or %NULL
	 *     if there is no language identified by the given @id. Return value is
	 *     owned by @lm and should not be freed.
	 */
	public Language getLanguage(string id)
	{
		auto __p = gtk_source_language_manager_get_language(gtkSourceLanguageManager, Str.toStringz(id));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Language)(cast(GtkSourceLanguage*) __p);
	}

	/**
	 * Returns the ids of the available languages.
	 *
	 * Returns: a %NULL-terminated array of strings containing the ids of the available
	 *     languages or %NULL if no language is available.
	 *     The array is sorted alphabetically according to the language name.
	 *     The array is owned by @lm and must not be modified.
	 */
	public string[] getLanguageIds()
	{
		return Str.toStringArray(gtk_source_language_manager_get_language_ids(gtkSourceLanguageManager));
	}

	/**
	 * Gets the list directories where @lm looks for language files.
	 *
	 * Returns: %NULL-terminated array
	 *     containing a list of language files directories.
	 *     The array is owned by @lm and must not be modified.
	 */
	public string[] getSearchPath()
	{
		return Str.toStringArray(gtk_source_language_manager_get_search_path(gtkSourceLanguageManager));
	}

	/**
	 * Picks a #GtkSourceLanguage for given file name and content type,
	 * according to the information in lang files. Either @filename or
	 * @content_type may be %NULL. This function can be used as follows:
	 *
	 * <informalexample><programlisting>
	 * GtkSourceLanguage *lang;
	 * lang = gtk_source_language_manager_guess_language (filename, NULL);
	 * gtk_source_buffer_set_language (buffer, lang);
	 * </programlisting></informalexample>
	 *
	 * or
	 *
	 * <informalexample><programlisting>
	 * GtkSourceLanguage *lang = NULL;
	 * gboolean result_uncertain;
	 * gchar *content_type;
	 *
	 * content_type = g_content_type_guess (filename, NULL, 0, &result_uncertain);
	 * if (result_uncertain)
	 * {
	 * g_free (content_type);
	 * content_type = NULL;
	 * }
	 *
	 * lang = gtk_source_language_manager_guess_language (manager, filename, content_type);
	 * gtk_source_buffer_set_language (buffer, lang);
	 *
	 * g_free (content_type);
	 * </programlisting></informalexample>
	 *
	 * etc. Use gtk_source_language_get_mime_types() and gtk_source_language_get_globs()
	 * if you need full control over file -> language mapping.
	 *
	 * Params:
	 *     filename = a filename in Glib filename encoding, or %NULL.
	 *     contentType = a content type (as in GIO API), or %NULL.
	 *
	 * Returns: a #GtkSourceLanguage, or %NULL if there
	 *     is no suitable language for given @filename and/or @content_type. Return
	 *     value is owned by @lm and should not be freed.
	 *
	 * Since: 2.4
	 */
	public Language guessLanguage(string filename, string contentType)
	{
		auto __p = gtk_source_language_manager_guess_language(gtkSourceLanguageManager, Str.toStringz(filename), Str.toStringz(contentType));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Language)(cast(GtkSourceLanguage*) __p);
	}

	/**
	 * Sets the list of directories where the @lm looks for
	 * language files.
	 * If @dirs is %NULL, the search path is reset to default.
	 *
	 * <note>
	 * <para>
	 * At the moment this function can be called only before the
	 * language files are loaded for the first time. In practice
	 * to set a custom search path for a #GtkSourceLanguageManager,
	 * you have to call this function right after creating it.
	 * </para>
	 * </note>
	 *
	 * Params:
	 *     dirs = a %NULL-terminated array of
	 *         strings or %NULL.
	 */
	public void setSearchPath(string[] dirs)
	{
		gtk_source_language_manager_set_search_path(gtkSourceLanguageManager, Str.toStringzArray(dirs));
	}
}
