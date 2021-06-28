module gtk.AssistantPage;

private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkAssistantPage` is an auxiliary object used by `GtkAssistant.
 */
public class AssistantPage : ObjectG
{
	/** the main Gtk struct */
	protected GtkAssistantPage* gtkAssistantPage;

	/** Get the main Gtk struct */
	public GtkAssistantPage* getAssistantPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkAssistantPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkAssistantPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkAssistantPage* gtkAssistantPage, bool ownedRef = false)
	{
		this.gtkAssistantPage = gtkAssistantPage;
		super(cast(GObject*)gtkAssistantPage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_assistant_page_get_type();
	}

	/**
	 * Returns the child to which @page belongs.
	 *
	 * Returns: the child to which @page belongs
	 */
	public Widget getChild()
	{
		auto __p = gtk_assistant_page_get_child(gtkAssistantPage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}
}
