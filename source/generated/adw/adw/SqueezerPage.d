module adw.SqueezerPage;

private import adw.c.functions;
public  import adw.c.types;
private import gobject.ObjectG;
private import gtk.Widget;


/**
 * An auxiliary class used by [class@Adw.Squeezer].
 */
public class SqueezerPage : ObjectG
{
	/** the main Gtk struct */
	protected AdwSqueezerPage* adwSqueezerPage;

	/** Get the main Gtk struct */
	public AdwSqueezerPage* getSqueezerPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwSqueezerPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwSqueezerPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwSqueezerPage* adwSqueezerPage, bool ownedRef = false)
	{
		this.adwSqueezerPage = adwSqueezerPage;
		super(cast(GObject*)adwSqueezerPage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_squeezer_page_get_type();
	}

	/**
	 * Returns the squeezer child to which @self belongs.
	 *
	 * Returns: the child to which @self belongs
	 *
	 * Since: 1.0
	 */
	public Widget getChild()
	{
		auto __p = adw_squeezer_page_get_child(adwSqueezerPage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets whether @self is enabled.
	 *
	 * Returns: whether @self is enabled
	 *
	 * Since: 1.0
	 */
	public bool getEnabled()
	{
		return adw_squeezer_page_get_enabled(adwSqueezerPage) != 0;
	}

	/**
	 * Sets whether @self is enabled.
	 *
	 * Params:
	 *     enabled = whether @self is enabled
	 *
	 * Since: 1.0
	 */
	public void setEnabled(bool enabled)
	{
		adw_squeezer_page_set_enabled(adwSqueezerPage, enabled);
	}
}
