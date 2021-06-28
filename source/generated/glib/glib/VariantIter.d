module glib.VariantIter;

private import glib.Str;
private import glib.Variant;
private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/**
 * #GVariantIter is an opaque data structure and can only be accessed
 * using the following functions.
 */
public class VariantIter
{
	/** the main Gtk struct */
	protected GVariantIter* gVariantIter;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GVariantIter* getVariantIterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gVariantIter;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gVariantIter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GVariantIter* gVariantIter, bool ownedRef = false)
	{
		this.gVariantIter = gVariantIter;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			g_variant_iter_free(gVariantIter);
	}


	/**
	 * Creates a new heap-allocated #GVariantIter to iterate over the
	 * container that was being iterated over by @iter.  Iteration begins on
	 * the new iterator from the current position of the old iterator but
	 * the two copies are independent past that point.
	 *
	 * Use g_variant_iter_free() to free the return value when you no longer
	 * need it.
	 *
	 * A reference is taken to the container that @iter is iterating over
	 * and will be related only when g_variant_iter_free() is called.
	 *
	 * Returns: a new heap-allocated #GVariantIter
	 *
	 * Since: 2.24
	 */
	public VariantIter copy()
	{
		auto __p = g_variant_iter_copy(gVariantIter);

		if(__p is null)
		{
			return null;
		}

		return new VariantIter(cast(GVariantIter*) __p, true);
	}

	/**
	 * Frees a heap-allocated #GVariantIter.  Only call this function on
	 * iterators that were returned by g_variant_iter_new() or
	 * g_variant_iter_copy().
	 *
	 * Since: 2.24
	 */
	public void free()
	{
		g_variant_iter_free(gVariantIter);
		ownedRef = false;
	}

	/**
	 * Initialises (without allocating) a #GVariantIter.  @iter may be
	 * completely uninitialised prior to this call; its old value is
	 * ignored.
	 *
	 * The iterator remains valid for as long as @value exists, and need not
	 * be freed in any way.
	 *
	 * Params:
	 *     value = a container #GVariant
	 *
	 * Returns: the number of items in @value
	 *
	 * Since: 2.24
	 */
	public size_t init(Variant value)
	{
		return g_variant_iter_init(gVariantIter, (value is null) ? null : value.getVariantStruct());
	}

	/**
	 * Queries the number of child items in the container that we are
	 * iterating over.  This is the total number of items -- not the number
	 * of items remaining.
	 *
	 * This function might be useful for preallocation of arrays.
	 *
	 * Returns: the number of children in the container
	 *
	 * Since: 2.24
	 */
	public size_t nChildren()
	{
		return g_variant_iter_n_children(gVariantIter);
	}

	/**
	 * Gets the next item in the container.  If no more items remain then
	 * %NULL is returned.
	 *
	 * Use g_variant_unref() to drop your reference on the return value when
	 * you no longer need it.
	 *
	 * Here is an example for iterating with g_variant_iter_next_value():
	 * |[<!-- language="C" -->
	 * // recursively iterate a container
	 * void
	 * iterate_container_recursive (GVariant *container)
	 * {
	 * GVariantIter iter;
	 * GVariant *child;
	 *
	 * g_variant_iter_init (&iter, container);
	 * while ((child = g_variant_iter_next_value (&iter)))
	 * {
	 * g_print ("type '%s'\n", g_variant_get_type_string (child));
	 *
	 * if (g_variant_is_container (child))
	 * iterate_container_recursive (child);
	 *
	 * g_variant_unref (child);
	 * }
	 * }
	 * ]|
	 *
	 * Returns: a #GVariant, or %NULL
	 *
	 * Since: 2.24
	 */
	public Variant nextValue()
	{
		auto __p = g_variant_iter_next_value(gVariantIter);

		if(__p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) __p, true);
	}
}
