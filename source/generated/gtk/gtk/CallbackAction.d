module gtk.CallbackAction;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.ShortcutAction;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutAction` that invokes a callback.
 */
public class CallbackAction : ShortcutAction
{
	/** the main Gtk struct */
	protected GtkCallbackAction* gtkCallbackAction;

	/** Get the main Gtk struct */
	public GtkCallbackAction* getCallbackActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCallbackAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCallbackAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCallbackAction* gtkCallbackAction, bool ownedRef = false)
	{
		this.gtkCallbackAction = gtkCallbackAction;
		super(cast(GtkShortcutAction*)gtkCallbackAction, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_callback_action_get_type();
	}

	/**
	 * Create a custom action that calls the given @callback when
	 * activated.
	 *
	 * Params:
	 *     callback = the callback to call
	 *     data = the data to be passed to @callback
	 *     destroy = the function to be called when the
	 *         callback action is finalized
	 *
	 * Returns: A new shortcut action
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GtkShortcutFunc callback, void* data, GDestroyNotify destroy)
	{
		auto __p = gtk_callback_action_new(callback, data, destroy);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCallbackAction*) __p, true);
	}
}
