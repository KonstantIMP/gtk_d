module sourceview.StyleSchemeChooserT;

public  import gobject.ObjectG;
public  import sourceview.StyleScheme;
public  import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public template StyleSchemeChooserT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkSourceStyleSchemeChooser* getStyleSchemeChooserStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkSourceStyleSchemeChooser*)getStruct();
	}


	/**
	 * Gets the currently-selected scheme.
	 *
	 * Returns: the currently-selected scheme.
	 *
	 * Since: 3.16
	 */
	public StyleScheme getStyleScheme()
	{
		auto __p = gtk_source_style_scheme_chooser_get_style_scheme(getStyleSchemeChooserStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(StyleScheme)(cast(GtkSourceStyleScheme*) __p);
	}

	/**
	 * Sets the scheme.
	 *
	 * Params:
	 *     scheme = a #GtkSourceStyleScheme
	 *
	 * Since: 3.16
	 */
	public void setStyleScheme(StyleScheme scheme)
	{
		gtk_source_style_scheme_chooser_set_style_scheme(getStyleSchemeChooserStruct(), (scheme is null) ? null : scheme.getStyleSchemeStruct());
	}
}
