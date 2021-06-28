module atk.NoOpObject;

private import atk.ActionIF;
private import atk.ActionT;
private import atk.ComponentIF;
private import atk.ComponentT;
private import atk.DocumentIF;
private import atk.DocumentT;
private import atk.EditableTextIF;
private import atk.EditableTextT;
private import atk.HypertextIF;
private import atk.HypertextT;
private import atk.ImageIF;
private import atk.ImageT;
private import atk.ObjectAtk;
private import atk.SelectionIF;
private import atk.SelectionT;
private import atk.TableCellIF;
private import atk.TableCellT;
private import atk.TableIF;
private import atk.TableT;
private import atk.TextIF;
private import atk.TextT;
private import atk.ValueIF;
private import atk.ValueT;
private import atk.WindowIF;
private import atk.WindowT;
private import atk.c.functions;
public  import atk.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * An AtkNoOpObject is an AtkObject which purports to implement all
 * ATK interfaces. It is the type of AtkObject which is created if an
 * accessible object is requested for an object type for which no
 * factory type is specified.
 */
public class NoOpObject : ObjectAtk, ActionIF, ComponentIF, DocumentIF, EditableTextIF, HypertextIF, ImageIF, SelectionIF, TableIF, TableCellIF, TextIF, ValueIF, WindowIF
{
	/** the main Gtk struct */
	protected AtkNoOpObject* atkNoOpObject;

	/** Get the main Gtk struct */
	public AtkNoOpObject* getNoOpObjectStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return atkNoOpObject;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)atkNoOpObject;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AtkNoOpObject* atkNoOpObject, bool ownedRef = false)
	{
		this.atkNoOpObject = atkNoOpObject;
		super(cast(AtkObject*)atkNoOpObject, ownedRef);
	}

	// add the Action capabilities
	mixin ActionT!(AtkNoOpObject);

	// add the Component capabilities
	mixin ComponentT!(AtkNoOpObject);

	// add the Document capabilities
	mixin DocumentT!(AtkNoOpObject);

	// add the EditableText capabilities
	mixin EditableTextT!(AtkNoOpObject);

	// add the Hypertext capabilities
	mixin HypertextT!(AtkNoOpObject);

	// add the Image capabilities
	mixin ImageT!(AtkNoOpObject);

	// add the Selection capabilities
	mixin SelectionT!(AtkNoOpObject);

	// add the Table capabilities
	mixin TableT!(AtkNoOpObject);

	// add the TableCell capabilities
	mixin TableCellT!(AtkNoOpObject);

	// add the Text capabilities
	mixin TextT!(AtkNoOpObject);

	// add the Value capabilities
	mixin ValueT!(AtkNoOpObject);

	// add the Window capabilities
	mixin WindowT!(AtkNoOpObject);

	/**
	 * Removes the specified child of the object from the object's selection.
	 *
	 * Params:
	 *     i = a #gint specifying the index in the selection set.  (e.g. the
	 *         ith selection as opposed to the ith child).
	 *
	 * Return: TRUE if success, FALSE otherwise.
	 */
	public bool removeSelection(int i) {
		return atk_selection_remove_selection(getSelectionStruct(), i) != 0;
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return atk_no_op_object_get_type();
	}

	/**
	 * Provides a default (non-functioning stub) #AtkObject.
	 * Application maintainers should not use this method.
	 *
	 * Params:
	 *     obj = a #GObject
	 *
	 * Returns: a default (non-functioning stub) #AtkObject
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ObjectG obj)
	{
		auto __p = atk_no_op_object_new((obj is null) ? null : obj.getObjectGStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AtkNoOpObject*) __p, true);
	}
}
