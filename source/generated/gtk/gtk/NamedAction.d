module gtk.NamedAction;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.ShortcutAction;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutAction` that activates an action by name.
 */
public class NamedAction : ShortcutAction
{
	/** the main Gtk struct */
	protected GtkNamedAction* gtkNamedAction;

	/** Get the main Gtk struct */
	public GtkNamedAction* getNamedActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkNamedAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkNamedAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkNamedAction* gtkNamedAction, bool ownedRef = false)
	{
		this.gtkNamedAction = gtkNamedAction;
		super(cast(GtkShortcutAction*)gtkNamedAction, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_named_action_get_type();
	}

	/**
	 * Creates an action that when activated, activates
	 * the named action on the widget.
	 *
	 * It also passes the given arguments to it.
	 *
	 * See [method@Gtk.Widget.insert_action_group] for
	 * how to add actions to widgets.
	 *
	 * Params:
	 *     name = the detailed name of the action
	 *
	 * Returns: a new `GtkShortcutAction`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name)
	{
		auto __p = gtk_named_action_new(Str.toStringz(name));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkNamedAction*) __p, true);
	}

	/**
	 * Returns the name of the action that will be activated.
	 *
	 * Returns: the name of the action to activate
	 */
	public string getActionName()
	{
		return Str.toString(gtk_named_action_get_action_name(gtkNamedAction));
	}
}
