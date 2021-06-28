module gtk.NotebookPage;

private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkNotebookPage` is an auxiliary object used by `GtkNotebook`.
 */
public class NotebookPage : ObjectG
{
	/** the main Gtk struct */
	protected GtkNotebookPage* gtkNotebookPage;

	/** Get the main Gtk struct */
	public GtkNotebookPage* getNotebookPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkNotebookPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkNotebookPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkNotebookPage* gtkNotebookPage, bool ownedRef = false)
	{
		this.gtkNotebookPage = gtkNotebookPage;
		super(cast(GObject*)gtkNotebookPage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_notebook_page_get_type();
	}

	/**
	 * Returns the notebook child to which @page belongs.
	 *
	 * Returns: the child to which @page belongs
	 */
	public Widget getChild()
	{
		auto __p = gtk_notebook_page_get_child(gtkNotebookPage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}
}
