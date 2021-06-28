module gtk.ObjectExpression;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Expression;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GObject` value in a `GtkExpression`.
 */
public class ObjectExpression : Expression
{
	/** the main Gtk struct */
	protected GtkObjectExpression* gtkObjectExpression;

	/** Get the main Gtk struct */
	public GtkObjectExpression* getObjectExpressionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkObjectExpression;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkObjectExpression;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkObjectExpression* gtkObjectExpression, bool ownedRef = false)
	{
		this.gtkObjectExpression = gtkObjectExpression;
		super(cast(GtkExpression*)gtkObjectExpression, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_object_expression_get_type();
	}

	/**
	 * Creates an expression evaluating to the given `object` with a weak reference.
	 *
	 * Once the `object` is disposed, it will fail to evaluate.
	 *
	 * This expression is meant to break reference cycles.
	 *
	 * If you want to keep a reference to `object`, use [ctor@Gtk.ConstantExpression.new].
	 *
	 * Params:
	 *     object = object to watch
	 *
	 * Returns: a new `GtkExpression`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ObjectG object)
	{
		auto __p = gtk_object_expression_new((object is null) ? null : object.getObjectGStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkObjectExpression*) __p);
	}

	/**
	 * Gets the object that the expression evaluates to.
	 *
	 * Returns: the object, or `NULL`
	 */
	public ObjectG getObject()
	{
		auto __p = gtk_object_expression_get_object(cast(GtkExpression*)gtkObjectExpression);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
	}
}
