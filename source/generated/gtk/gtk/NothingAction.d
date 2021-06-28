module gtk.NothingAction;

private import gobject.ObjectG;
private import gtk.ShortcutAction;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutAction` that does nothing.
 */
public class NothingAction : ShortcutAction
{
	/** the main Gtk struct */
	protected GtkNothingAction* gtkNothingAction;

	/** Get the main Gtk struct */
	public GtkNothingAction* getNothingActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkNothingAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkNothingAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkNothingAction* gtkNothingAction, bool ownedRef = false)
	{
		this.gtkNothingAction = gtkNothingAction;
		super(cast(GtkShortcutAction*)gtkNothingAction, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_nothing_action_get_type();
	}

	/**
	 * Gets the nothing action.
	 *
	 * This is an action that does nothing and where
	 * activating it always fails.
	 *
	 * Returns: The nothing action
	 */
	public static NothingAction get()
	{
		auto __p = gtk_nothing_action_get();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(NothingAction)(cast(GtkNothingAction*) __p);
	}
}
