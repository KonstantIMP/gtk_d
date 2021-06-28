module sourceview.StyleSchemeChooserIF;

private import gobject.ObjectG;
private import sourceview.StyleScheme;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public interface StyleSchemeChooserIF{
	/** Get the main Gtk struct */
	public GtkSourceStyleSchemeChooser* getStyleSchemeChooserStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_source_style_scheme_chooser_get_type();
	}

	/**
	 * Gets the currently-selected scheme.
	 *
	 * Returns: the currently-selected scheme.
	 *
	 * Since: 3.16
	 */
	public StyleScheme getStyleScheme();

	/**
	 * Sets the scheme.
	 *
	 * Params:
	 *     scheme = a #GtkSourceStyleScheme
	 *
	 * Since: 3.16
	 */
	public void setStyleScheme(StyleScheme scheme);
}
