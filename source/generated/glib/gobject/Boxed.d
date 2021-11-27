module gobject.Boxed;

private import glib.Str;
private import gobject.c.functions;
public  import gobject.c.types;


/** */
public struct Boxed
{

	/**
	 * Provide a copy of a boxed structure @src_boxed which is of type @boxed_type.
	 *
	 * Params:
	 *     boxedType = The type of @src_boxed.
	 *     srcBoxed = The boxed structure to be copied.
	 *
	 * Returns: The newly created copy of the boxed
	 *     structure.
	 */
	public static void* copy(GType boxedType, void* srcBoxed)
	{
		return g_boxed_copy(boxedType, srcBoxed);
	}

	/**
	 * Free the boxed structure @boxed which is of type @boxed_type.
	 *
	 * Params:
	 *     boxedType = The type of @boxed.
	 *     boxed = The boxed structure to be freed.
	 */
	public static void free(GType boxedType, void* boxed)
	{
		g_boxed_free(boxedType, boxed);
	}

	/**
	 * This function creates a new %G_TYPE_BOXED derived type id for a new
	 * boxed type with name @name.
	 *
	 * Boxed type handling functions have to be provided to copy and free
	 * opaque boxed structures of this type.
	 *
	 * For the general case, it is recommended to use #G_DEFINE_BOXED_TYPE
	 * instead of calling g_boxed_type_register_static() directly. The macro
	 * will create the appropriate `*_get_type()` function for the boxed type.
	 *
	 * Params:
	 *     name = Name of the new boxed type.
	 *     boxedCopy = Boxed structure copy function.
	 *     boxedFree = Boxed structure free function.
	 *
	 * Returns: New %G_TYPE_BOXED derived type id for @name.
	 */
	public static GType typeRegisterStatic(string name, GBoxedCopyFunc boxedCopy, GBoxedFreeFunc boxedFree)
	{
		return g_boxed_type_register_static(Str.toStringz(name), boxedCopy, boxedFree);
	}

	/**
	 * Creates a new %G_TYPE_POINTER derived type id for a new
	 * pointer type with name @name.
	 *
	 * Params:
	 *     name = the name of the new pointer type.
	 *
	 * Returns: a new %G_TYPE_POINTER derived type id for @name.
	 */
	public static GType pointerTypeRegisterStatic(string name)
	{
		return g_pointer_type_register_static(Str.toStringz(name));
	}
}
