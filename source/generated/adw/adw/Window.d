module adw.Window;

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
private import gtk.NativeIF;
private import gtk.NativeT;
private import gtk.RootIF;
private import gtk.RootT;
private import gtk.ShortcutManagerIF;
private import gtk.ShortcutManagerT;
private import gtk.Widget;
private import gtk.Window : DGtkWindow = Window;


/**
 * A freeform window.
 * 
 * The `AdwWindow` widget is a subclass of [class@Gtk.Window] which has no
 * titlebar area. It means [class@Gtk.HeaderBar] can be used as follows:
 * 
 * ```xml
 * <object class="AdwWindow"/>
 * <child>
 * <object class="GtkBox">
 * <property name="orientation">vertical</property>
 * <child>
 * <object class="GtkHeaderBar"/>
 * </child>
 * <child>
 * ...
 * </child>
 * </object>
 * </child>
 * </object>
 * ```
 * 
 * Using [method@Gtk.Window.get_titlebar] and [method@Gtk.Window.set_titlebar]
 * is not supported and will result in a crash.
 *
 * Since: 1.0
 */
public class Window : DGtkWindow
{
	/** the main Gtk struct */
	protected AdwWindow* adwWindow;

	/** Get the main Gtk struct */
	public AdwWindow* getAdwWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwWindow* adwWindow, bool ownedRef = false)
	{
		this.adwWindow = adwWindow;
		super(cast(GtkWindow*)adwWindow, ownedRef);
	}

	/**
	 * Sets the child widget of @self.
	 *
	 * This method should always be used instead of [method@Gtk.Window.set_child].
	 *
	 * Params:
	 *     child = the child widget
	 *
	 * Since: 1.0
	 */
	public override void setChild(Widget child) {
		adw_window_set_child(adwWindow, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return adw_window_get_type();
	}

	/**
	 * Creates a new `AdwWindow`.
	 *
	 * Returns: the newly created `AdwWindow`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = adw_window_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwWindow*) __p);
	}

	/**
	 * Gets the child widget of @self.
	 *
	 * This method should always be used instead of [method@Gtk.Window.get_child].
	 *
	 * Returns: the child widget of @self
	 *
	 * Since: 1.0
	 */
	public override Widget getChild()
	{
		auto __p = adw_window_get_child(adwWindow);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}
}
