module gtk.NeverTrigger;

private import gobject.ObjectG;
private import gtk.ShortcutTrigger;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutTrigger` that never triggers.
 */
public class NeverTrigger : ShortcutTrigger
{
	/** the main Gtk struct */
	protected GtkNeverTrigger* gtkNeverTrigger;

	/** Get the main Gtk struct */
	public GtkNeverTrigger* getNeverTriggerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkNeverTrigger;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkNeverTrigger;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkNeverTrigger* gtkNeverTrigger, bool ownedRef = false)
	{
		this.gtkNeverTrigger = gtkNeverTrigger;
		super(cast(GtkShortcutTrigger*)gtkNeverTrigger, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_never_trigger_get_type();
	}

	/**
	 * Gets the never trigger.
	 *
	 * This is a singleton for a trigger that never triggers.
	 * Use this trigger instead of %NULL because it implements
	 * all virtual functions.
	 *
	 * Returns: The never trigger
	 */
	public static NeverTrigger get()
	{
		auto __p = gtk_never_trigger_get();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(NeverTrigger)(cast(GtkNeverTrigger*) __p);
	}
}
