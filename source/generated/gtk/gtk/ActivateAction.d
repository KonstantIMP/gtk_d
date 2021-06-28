module gtk.ActivateAction;

private import gobject.ObjectG;
private import gtk.ShortcutAction;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutAction` that calls gtk_widget_activate().
 */
public class ActivateAction : ShortcutAction
{
	/** the main Gtk struct */
	protected GtkActivateAction* gtkActivateAction;

	/** Get the main Gtk struct */
	public GtkActivateAction* getActivateActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkActivateAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkActivateAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkActivateAction* gtkActivateAction, bool ownedRef = false)
	{
		this.gtkActivateAction = gtkActivateAction;
		super(cast(GtkShortcutAction*)gtkActivateAction, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_activate_action_get_type();
	}

	/**
	 * Gets the activate action.
	 *
	 * This is an action that calls gtk_widget_activate()
	 * on the given widget upon activation.
	 *
	 * Returns: The activate action
	 */
	public static ActivateAction get()
	{
		auto __p = gtk_activate_action_get();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ActivateAction)(cast(GtkActivateAction*) __p);
	}
}
