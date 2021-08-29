module gtk.TreeDragSourceIF;

private import gdk.ContentProvider;
private import gobject.ObjectG;
private import gtk.TreePath;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Interface for Drag-and-Drop destinations in `GtkTreeView`.
 */
public interface TreeDragSourceIF{
	/** Get the main Gtk struct */
	public GtkTreeDragSource* getTreeDragSourceStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_tree_drag_source_get_type();
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
	public bool dragDataDelete(TreePath path);

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
	public ContentProvider dragDataGet(TreePath path);

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
	public bool rowDraggable(TreePath path);
}
