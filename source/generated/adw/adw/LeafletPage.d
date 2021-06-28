module adw.LeafletPage;

private import adw.c.functions;
public  import adw.c.types;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.Widget;


/**
 * An auxiliary class used by [class@Adw.Leaflet].
 */
public class LeafletPage : ObjectG
{
	/** the main Gtk struct */
	protected AdwLeafletPage* adwLeafletPage;

	/** Get the main Gtk struct */
	public AdwLeafletPage* getLeafletPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwLeafletPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwLeafletPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwLeafletPage* adwLeafletPage, bool ownedRef = false)
	{
		this.adwLeafletPage = adwLeafletPage;
		super(cast(GObject*)adwLeafletPage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_leaflet_page_get_type();
	}

	/**
	 * Gets the leaflet child th which @self belongs.
	 *
	 * Returns: the child to which @self belongs
	 *
	 * Since: 1.0
	 */
	public Widget getChild()
	{
		auto __p = adw_leaflet_page_get_child(adwLeafletPage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets the name of @self.
	 *
	 * Returns: the name of @self.
	 *
	 * Since: 1.0
	 */
	public string getName()
	{
		return Str.toString(adw_leaflet_page_get_name(adwLeafletPage));
	}

	/**
	 * Gets whether the child can be navigated to when folded.
	 *
	 * Returns: whether @self can be navigated to when folded
	 *
	 * Since: 1.0
	 */
	public bool getNavigatable()
	{
		return adw_leaflet_page_get_navigatable(adwLeafletPage) != 0;
	}

	/**
	 * Sets the name of the @self.
	 *
	 * Params:
	 *     name = the new value to set
	 *
	 * Since: 1.0
	 */
	public void setName(string name)
	{
		adw_leaflet_page_set_name(adwLeafletPage, Str.toStringz(name));
	}

	/**
	 * Sets whether @self can be navigated to when folded.
	 *
	 * Params:
	 *     navigatable = whether @self can be navigated to when folded
	 *
	 * Since: 1.0
	 */
	public void setNavigatable(bool navigatable)
	{
		adw_leaflet_page_set_navigatable(adwLeafletPage, navigatable);
	}
}
