module glib.TreeNode;

private import glib.c.functions;
public  import glib.c.types;


/**
 * An opaque type which identifies a specific node in a #GTree.
 *
 * Since: 2.68
 */
public class TreeNode
{
	/** the main Gtk struct */
	protected GTreeNode* gTreeNode;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTreeNode* getTreeNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTreeNode;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTreeNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTreeNode* gTreeNode, bool ownedRef = false)
	{
		this.gTreeNode = gTreeNode;
		this.ownedRef = ownedRef;
	}


	/**
	 * Gets the key stored at a particular tree node.
	 *
	 * Returns: the key at the node.
	 *
	 * Since: 2.68
	 */
	public void* key()
	{
		return g_tree_node_key(gTreeNode);
	}

	/**
	 * Returns the next in-order node of the tree, or %NULL
	 * if the passed node was already the last one.
	 *
	 * Returns: the next node in the tree
	 *
	 * Since: 2.68
	 */
	public TreeNode next()
	{
		auto __p = g_tree_node_next(gTreeNode);

		if(__p is null)
		{
			return null;
		}

		return new TreeNode(cast(GTreeNode*) __p);
	}

	/**
	 * Returns the previous in-order node of the tree, or %NULL
	 * if the passed node was already the first one.
	 *
	 * Returns: the previous node in the tree
	 *
	 * Since: 2.68
	 */
	public TreeNode previous()
	{
		auto __p = g_tree_node_previous(gTreeNode);

		if(__p is null)
		{
			return null;
		}

		return new TreeNode(cast(GTreeNode*) __p);
	}

	/**
	 * Gets the value stored at a particular tree node.
	 *
	 * Returns: the value at the node.
	 *
	 * Since: 2.68
	 */
	public void* value()
	{
		return g_tree_node_value(gTreeNode);
	}
}
