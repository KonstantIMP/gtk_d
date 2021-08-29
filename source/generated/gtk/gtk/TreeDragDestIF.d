module gtk.TreeDragDestIF;

private import gobject.Value;
private import gtk.TreePath;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Interface for Drag-and-Drop destinations in `GtkTreeView`.
 */
public interface TreeDragDestIF{
	/** Get the main Gtk struct */
	public GtkTreeDragDest* getTreeDragDestStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_tree_drag_dest_get_type();
	}

	/**
	 * Asks the `GtkTreeDragDest` to insert a row before the path @dest,
	 * deriving the contents of the row from @value. If @dest is
	 * outside the tree so that inserting before it is impossible, %FALSE
	 * will be returned. Also, %FALSE may be returned if the new row is
	 * not created for some model-specific reason.  Should robustly handle
	 * a @dest no longer found in the model!
	 *
	 * Params:
	 *     dest = row to drop in front of
	 *     value = data to drop
	 *
	 * Returns: whether a new row was created before position @dest
	 */
	public bool dragDataReceived(TreePath dest, Value value);

	/**
	 * Determines whether a drop is possible before the given @dest_path,
	 * at the same depth as @dest_path. i.e., can we drop the data in
	 * @value at that location. @dest_path does not have to
	 * exist; the return value will almost certainly be %FALSE if the
	 * parent of @dest_path doesn’t exist, though.
	 *
	 * Params:
	 *     destPath = destination row
	 *     value = the data being dropped
	 *
	 * Returns: %TRUE if a drop is possible before @dest_path
	 */
	public bool rowDropPossible(TreePath destPath, Value value);
}
