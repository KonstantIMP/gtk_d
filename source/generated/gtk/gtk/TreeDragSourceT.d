module gtk.TreeDragSourceT;

public  import gdk.ContentProvider;
public  import gobject.ObjectG;
public  import gtk.TreePath;
public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * Interface for Drag-and-Drop destinations in `GtkTreeView`.
 */
public template TreeDragSourceT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkTreeDragSource* getTreeDragSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkTreeDragSource*)getStruct();
	}


	/**
	 * Asks the `GtkTreeDragSource` to delete the row at @path, because
	 * it was moved somewhere else via drag-and-drop. Returns %FALSE
	 * if the deletion fails because @path no longer exists, or for
	 * some model-specific reason. Should robustly handle a @path no
	 * longer found in the model!
	 *
	 * Params:
	 *     path = row that was being dragged
	 *
	 * Returns: %TRUE if the row was successfully deleted
	 */
	public bool dragDataDelete(TreePath path)
	{
		return gtk_tree_drag_source_drag_data_delete(getTreeDragSourceStruct(), (path is null) ? null : path.getTreePathStruct()) != 0;
	}

	/**
	 * Asks the `GtkTreeDragSource` to return a `GdkContentProvider` representing
	 * the row at @path. Should robustly handle a @path no
	 * longer found in the model!
	 *
	 * Params:
	 *     path = row that was dragged
	 *
	 * Returns: a `GdkContentProvider` for the
	 *     given @path
	 */
	public ContentProvider dragDataGet(TreePath path)
	{
		auto __p = gtk_tree_drag_source_drag_data_get(getTreeDragSourceStruct(), (path is null) ? null : path.getTreePathStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ContentProvider)(cast(GdkContentProvider*) __p, true);
	}

	/**
	 * Asks the `GtkTreeDragSource` whether a particular row can be used as
	 * the source of a DND operation. If the source doesn’t implement
	 * this interface, the row is assumed draggable.
	 *
	 * Params:
	 *     path = row on which user is initiating a drag
	 *
	 * Returns: %TRUE if the row can be dragged
	 */
	public bool rowDraggable(TreePath path)
	{
		return gtk_tree_drag_source_row_draggable(getTreeDragSourceStruct(), (path is null) ? null : path.getTreePathStruct()) != 0;
	}
}
