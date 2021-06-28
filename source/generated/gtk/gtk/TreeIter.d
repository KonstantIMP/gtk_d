module gtk.TreeIter;

private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;
private import linker.loader;


/**
 * The #GtkTreeIter is the primary structure
 * for accessing a #GtkTreeModel. Models are expected to put a unique
 * integer in the @stamp member, and put
 * model-specific data in the three @user_data
 * members.
 */
public class TreeIter
{
	/** the main Gtk struct */
	protected GtkTreeIter* gtkTreeIter;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GtkTreeIter* getTreeIterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkTreeIter;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkTreeIter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkTreeIter* gtkTreeIter, bool ownedRef = false)
	{
		this.gtkTreeIter = gtkTreeIter;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GTK[0]) && ownedRef )
			gtk_tree_iter_free(gtkTreeIter);
	}


	/** */
	public static GType getType()
	{
		return gtk_tree_iter_get_type();
	}

	/**
	 * Creates a dynamically allocated tree iterator as a copy of @iter.
	 *
	 * This function is not intended for use in applications,
	 * because you can just copy the structs by value
	 * (`GtkTreeIter new_iter = iter;`).
	 * You must free this iter with gtk_tree_iter_free().
	 *
	 * Returns: a newly-allocated copy of @iter
	 */
	public TreeIter copy()
	{
		auto __p = gtk_tree_iter_copy(gtkTreeIter);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeIter)(cast(GtkTreeIter*) __p, true);
	}

	/**
	 * Frees an iterator that has been allocated by gtk_tree_iter_copy().
	 *
	 * This function is mainly used for language bindings.
	 */
	public void free()
	{
		gtk_tree_iter_free(gtkTreeIter);
		ownedRef = false;
	}
}
