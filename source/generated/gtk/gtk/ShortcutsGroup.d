module gtk.ShortcutsGroup;

private import gtk.Box;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutsGroup` represents a group of related keyboard shortcuts
 * or gestures.
 * 
 * The group has a title. It may optionally be associated with a view
 * of the application, which can be used to show only relevant shortcuts
 * depending on the application context.
 * 
 * This widget is only meant to be used with [class@Gtk.ShortcutsWindow].
 */
public class ShortcutsGroup : Box
{
	/** the main Gtk struct */
	protected GtkShortcutsGroup* gtkShortcutsGroup;

	/** Get the main Gtk struct */
	public GtkShortcutsGroup* getShortcutsGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkShortcutsGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkShortcutsGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkShortcutsGroup* gtkShortcutsGroup, bool ownedRef = false)
	{
		this.gtkShortcutsGroup = gtkShortcutsGroup;
		super(cast(GtkBox*)gtkShortcutsGroup, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_shortcuts_group_get_type();
	}
}
