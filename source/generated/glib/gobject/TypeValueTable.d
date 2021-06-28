module gobject.TypeValueTable;

private import gobject.c.functions;
public  import gobject.c.types;


/**
 * The #GTypeValueTable provides the functions required by the #GValue
 * implementation, to serve as a container for values of a type.
 */
public struct TypeValueTable
{

	/**
	 * Returns the location of the #GTypeValueTable associated with @type.
	 *
	 * Note that this function should only be used from source code
	 * that implements or has internal knowledge of the implementation of
	 * @type.
	 *
	 * Params:
	 *     type = a #GType
	 *
	 * Returns: location of the #GTypeValueTable associated with @type or
	 *     %NULL if there is no #GTypeValueTable associated with @type
	 */
	public static GTypeValueTable* peek(GType type)
	{
		return g_type_value_table_peek(type);
	}
}
