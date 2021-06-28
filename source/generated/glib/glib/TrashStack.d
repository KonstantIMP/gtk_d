module glib.TrashStack;

private import glib.MemorySlice;
private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/**
 * Each piece of memory that is pushed onto the stack
 * is cast to a GTrashStack*.
 * 
 * Deprecated: #GTrashStack is deprecated without replacement
 */
public struct TrashStack
{

	/**
	 * Returns the height of a #GTrashStack.
	 *
	 * Note that execution of this function is of O(N) complexity
	 * where N denotes the number of items on the stack.
	 *
	 * Deprecated: #GTrashStack is deprecated without replacement
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Returns: the height of the stack
	 */
	public static uint height(GTrashStack** stackP)
	{
		return g_trash_stack_height(stackP);
	}

	/**
	 * Returns the element at the top of a #GTrashStack
	 * which may be %NULL.
	 *
	 * Deprecated: #GTrashStack is deprecated without replacement
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Returns: the element at the top of the stack
	 */
	public static void* peek(GTrashStack** stackP)
	{
		return g_trash_stack_peek(stackP);
	}

	/**
	 * Pops a piece of memory off a #GTrashStack.
	 *
	 * Deprecated: #GTrashStack is deprecated without replacement
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Returns: the element at the top of the stack
	 */
	public static void* pop(GTrashStack** stackP)
	{
		return g_trash_stack_pop(stackP);
	}

	/**
	 * Pushes a piece of memory onto a #GTrashStack.
	 *
	 * Deprecated: #GTrashStack is deprecated without replacement
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *     dataP = the piece of memory to push on the stack
	 */
	public static void push(GTrashStack** stackP, void* dataP)
	{
		g_trash_stack_push(stackP, dataP);
	}
}
