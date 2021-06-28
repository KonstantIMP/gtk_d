module adw.Bin;

private import adw.c.functions;
public  import adw.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;


/**
 * A widget with one child.
 * 
 * The `AdwBin` widget has only one child, set with the [property@Adw.Bin:child]
 * property.
 * 
 * It is useful for deriving subclasses, since it provides common code needed
 * for handling a single child widget.
 *
 * Since: 1.0
 */
public class Bin : Widget
{
	/** the main Gtk struct */
	protected AdwBin* adwBin;

	/** Get the main Gtk struct */
	public AdwBin* getBinStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwBin;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwBin;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwBin* adwBin, bool ownedRef = false)
	{
		this.adwBin = adwBin;
		super(cast(GtkWidget*)adwBin, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_bin_get_type();
	}

	/**
	 * Creates a new `AdwBin`.
	 *
	 * Returns: the new created `AdwBin`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = adw_bin_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwBin*) __p);
	}

	/**
	 * Gets the child widget of @self.
	 *
	 * Returns: the child widget of @self
	 *
	 * Since: 1.0
	 */
	public Widget getChild()
	{
		auto __p = adw_bin_get_child(adwBin);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Sets the child widget of @self.
	 *
	 * Params:
	 *     child = the child widget
	 *
	 * Since: 1.0
	 */
	public void setChild(Widget child)
	{
		adw_bin_set_child(adwBin, (child is null) ? null : child.getWidgetStruct());
	}
}
