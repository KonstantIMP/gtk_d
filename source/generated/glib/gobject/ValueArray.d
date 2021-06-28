module gobject.ValueArray;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Value;
private import gobject.c.functions;
public  import gobject.c.types;
private import linker.loader;


/**
 * A #GValueArray contains an array of #GValue elements.
 */
public class ValueArray
{
	/** the main Gtk struct */
	protected GValueArray* gValueArray;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GValueArray* getValueArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gValueArray;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gValueArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GValueArray* gValueArray, bool ownedRef = false)
	{
		this.gValueArray = gValueArray;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GOBJECT[0]) && ownedRef )
			g_value_array_free(gValueArray);
	}


	/** */
	public static GType getType()
	{
		return g_value_array_get_type();
	}

	/**
	 * Allocate and initialize a new #GValueArray, optionally preserve space
	 * for @n_prealloced elements. New arrays always contain 0 elements,
	 * regardless of the value of @n_prealloced.
	 *
	 * Deprecated: Use #GArray and g_array_sized_new() instead.
	 *
	 * Params:
	 *     nPrealloced = number of values to preallocate space for
	 *
	 * Returns: a newly allocated #GValueArray with 0 values
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint nPrealloced)
	{
		auto __p = g_value_array_new(nPrealloced);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GValueArray*) __p);
	}

	/**
	 * Insert a copy of @value as last element of @value_array. If @value is
	 * %NULL, an uninitialized value is appended.
	 *
	 * Deprecated: Use #GArray and g_array_append_val() instead.
	 *
	 * Params:
	 *     value = #GValue to copy into #GValueArray, or %NULL
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray append(Value value)
	{
		auto __p = g_value_array_append(gValueArray, (value is null) ? null : value.getValueStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}

	/**
	 * Construct an exact copy of a #GValueArray by duplicating all its
	 * contents.
	 *
	 * Deprecated: Use #GArray and g_array_ref() instead.
	 *
	 * Returns: Newly allocated copy of #GValueArray
	 */
	public ValueArray copy()
	{
		auto __p = g_value_array_copy(gValueArray);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p, true);
	}

	/**
	 * Free a #GValueArray including its contents.
	 *
	 * Deprecated: Use #GArray and g_array_unref() instead.
	 */
	public void free()
	{
		g_value_array_free(gValueArray);
		ownedRef = false;
	}

	/**
	 * Return a pointer to the value at @index_ containd in @value_array.
	 *
	 * Deprecated: Use g_array_index() instead.
	 *
	 * Params:
	 *     index = index of the value of interest
	 *
	 * Returns: pointer to a value at @index_ in @value_array
	 */
	public Value getNth(uint index)
	{
		auto __p = g_value_array_get_nth(gValueArray, index);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Value)(cast(GValue*) __p);
	}

	/**
	 * Insert a copy of @value at specified position into @value_array. If @value
	 * is %NULL, an uninitialized value is inserted.
	 *
	 * Deprecated: Use #GArray and g_array_insert_val() instead.
	 *
	 * Params:
	 *     index = insertion position, must be <= value_array->;n_values
	 *     value = #GValue to copy into #GValueArray, or %NULL
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray insert(uint index, Value value)
	{
		auto __p = g_value_array_insert(gValueArray, index, (value is null) ? null : value.getValueStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}

	/**
	 * Insert a copy of @value as first element of @value_array. If @value is
	 * %NULL, an uninitialized value is prepended.
	 *
	 * Deprecated: Use #GArray and g_array_prepend_val() instead.
	 *
	 * Params:
	 *     value = #GValue to copy into #GValueArray, or %NULL
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray prepend(Value value)
	{
		auto __p = g_value_array_prepend(gValueArray, (value is null) ? null : value.getValueStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}

	/**
	 * Remove the value at position @index_ from @value_array.
	 *
	 * Deprecated: Use #GArray and g_array_remove_index() instead.
	 *
	 * Params:
	 *     index = position of value to remove, which must be less than
	 *         @value_array->n_values
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray remove(uint index)
	{
		auto __p = g_value_array_remove(gValueArray, index);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}

	/**
	 * Sort @value_array using @compare_func to compare the elements according to
	 * the semantics of #GCompareFunc.
	 *
	 * The current implementation uses the same sorting algorithm as standard
	 * C qsort() function.
	 *
	 * Deprecated: Use #GArray and g_array_sort().
	 *
	 * Params:
	 *     compareFunc = function to compare elements
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray sort(GCompareFunc compareFunc)
	{
		auto __p = g_value_array_sort(gValueArray, compareFunc);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}

	/**
	 * Sort @value_array using @compare_func to compare the elements according
	 * to the semantics of #GCompareDataFunc.
	 *
	 * The current implementation uses the same sorting algorithm as standard
	 * C qsort() function.
	 *
	 * Deprecated: Use #GArray and g_array_sort_with_data().
	 *
	 * Params:
	 *     compareFunc = function to compare elements
	 *     userData = extra data argument provided for @compare_func
	 *
	 * Returns: the #GValueArray passed in as @value_array
	 */
	public ValueArray sortWithData(GCompareDataFunc compareFunc, void* userData)
	{
		auto __p = g_value_array_sort_with_data(gValueArray, compareFunc, userData);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ValueArray)(cast(GValueArray*) __p);
	}
}
